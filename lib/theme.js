'use strict';

const nconf = require.main.require('nconf');
const meta = require.main.require('./src/meta');
// const user = require.main.require('./src/user');
const groups = require.main.require('./src/groups');
const routeHelpers = require.main.require('./src/routes/helpers');
const controllers = require('./controllers');

const library = module.exports;

const defaults = {
	enableQuickReply: 'on',
	centerHeaderElements: 'off',
	mobileTopicTeasers: 'off',
	stickyToolbar: 'on',
	autohideBottombar: 'on',
	openSidebars: 'off',
	chatModals: 'off',
};

library.init = async function (params) {
	const { router, middleware } = params;
	const routeHelpers = require.main.require('./src/routes/helpers');

	routeHelpers.setupAdminPageRoute(router, '/admin/plugins/theme-ga', [], controllers.renderAdminPage);

	routeHelpers.setupPageRoute(router, '/user/:userslug/theme', [
		middleware.exposeUid,
		middleware.ensureLoggedIn,
		middleware.canViewUsers,
		middleware.checkAccountPermissions,
	], controllers.renderThemeSettings);

	if (nconf.get('isPrimary') && process.env.NODE_ENV === 'production') {
		setTimeout(buildSkins, 0);
	}
};

library.addRoutes = async (params) => {
	const { router, helpers, middleware } = params;
	const middlewares = [
		middleware.ensureLoggedIn, // restrict to logged in users
		middleware.admin.checkPrivileges, // restrict to administrators
	];
	routeHelpers.setupApiRoute(router, 'get', '/category/children/:cid', middlewares, async (req, res) => {
		const children = await controllers.getCategoryCompleteChildren(req.params.cid);
		helpers.formatApiResponse(200, res, {
			parentCid: parseInt(req.params.cid, 10),
			totalChildren: children.length,
			cids: children,
		});
	});
};

async function buildSkins() {
	try {
		const plugins = require.main.require('./src/plugins');
		await plugins.prepareForBuild(['client side styles']);
		for (const skin of meta.css.supportedSkins) {
			// eslint-disable-next-line no-await-in-loop
			await meta.css.buildBundle(`client-${skin}`, true);
		}
		require.main.require('./src/meta/minifier').killAll();
	} catch (err) {
		console.error(err.stack);
	}
}

library.addAdminNavigation = async function (header) {
	header.plugins.push({
		route: '/plugins/theme-ga',
		icon: 'fa-paint-brush',
		name: 'Theme GA',
	});
	return header;
};

library.addProfileItem = async (data) => {
	data.links.push({
		id: 'theme',
		route: 'theme',
		icon: 'fa-paint-brush',
		name: '[[themes/harmony:settings.title]]',
		visibility: {
			self: true,
			other: false,
			moderator: false,
			globalMod: false,
			admin: false,
		},
	});

	return data;
};

library.addExtraDetails = async (data) => {
	// Add 'isPremium' attribute for logged in users
	if (data.length > 0) {
		data.forEach(async (elem) => {
			if (elem.uid) {
				elem.isPremium = await groups.isMember(data[0].uid, 'Premium');
			}
		});
	}
	return data;
};

library.defineWidgetAreas = async function (areas) {
	const locations = ['header', 'sidebar', 'footer'];
	const templates = [
		'categories.tpl', 'category.tpl', 'topic.tpl', 'users.tpl',
		'unread.tpl', 'recent.tpl', 'popular.tpl', 'top.tpl', 'tags.tpl', 'tag.tpl',
		'login.tpl', 'register.tpl',
	];
	function capitalizeFirst(str) {
		return str.charAt(0).toUpperCase() + str.slice(1);
	}
	templates.forEach((template) => {
		locations.forEach((location) => {
			areas.push({
				name: `${capitalizeFirst(template.split('.')[0])} ${capitalizeFirst(location)}`,
				template: template,
				location: location,
			});
		});
	});

	areas = areas.concat([
		{
			name: 'Main post header',
			template: 'topic.tpl',
			location: 'mainpost-header',
		},
		{
			name: 'Main post footer',
			template: 'topic.tpl',
			location: 'mainpost-footer',
		},
		{
			name: 'Sidebar Footer',
			template: 'global',
			location: 'sidebar-footer',
		},
		{
			name: 'Brand Header',
			template: 'global',
			location: 'brand-header',
		},
		{
			name: 'About me (before)',
			template: 'account/profile.tpl',
			location: 'profile-aboutme-before',
		},
		{
			name: 'About me (after)',
			template: 'account/profile.tpl',
			location: 'profile-aboutme-after',
		},
		{
			name: 'Chat Header',
			template: 'chats.tpl',
			location: 'header',
		},
	]);

	return areas;
};

library.loadThemeConfig = async function (/* uid */) {
	/*
	const [themeConfig, userConfig] = await Promise.all([
		meta.settings.get('harmony'),
		user.getSettings(uid),
	]);
	const config = { ...defaults, ...themeConfig, ...(_.pick(userConfig, Object.keys(defaults))) };
	*/
	const config = await meta.settings.get('harmony');
	config.enableQuickReply = config.enableQuickReply === 'on';
	config.centerHeaderElements = config.centerHeaderElements === 'on';
	config.mobileTopicTeasers = config.mobileTopicTeasers === 'on';
	config.stickyToolbar = config.stickyToolbar === 'on';
	config.autohideBottombar = config.autohideBottombar === 'on';
	config.openSidebars = config.openSidebars === 'on';
	config.chatModals = config.chatModals === 'on';
	return config;
};

library.getThemeConfig = async function (config) {
	config.theme = await library.loadThemeConfig(config.uid);
	config.openDraftsOnPageLoad = false;
	return config;
};

library.getAdminSettings = async function (hookData) {
	if (hookData.plugin === 'harmony') {
		hookData.values = {
			...defaults,
			...hookData.values,
		};
	}
	return hookData;
};

library.saveUserSettings = async function (hookData) {
	Object.keys(defaults).forEach((key) => {
		if (hookData.data.hasOwnProperty(key)) {
			hookData.settings[key] = hookData.data[key] || undefined;
		}
	});
	return hookData;
};

library.filterMiddlewareRenderHeader = async function (hookData) {
	hookData.templateData.bootswatchSkinOptions = await meta.css.getSkinSwitcherOptions(hookData.req.uid);
	return hookData;
};
