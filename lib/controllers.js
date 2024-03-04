'use strict';

const Controllers = module.exports;

const accountHelpers = require.main.require('./src/controllers/accounts/helpers');
const helpers = require.main.require('./src/controllers/helpers');
const categories = require.main.require('./src/categories');

// const db = require.main.require('./src/database');
// const _ = require('lodash');

// const categories = require('.src/categories');

// const ajaxify = require.main.require('./public/src/ajaxify');

Controllers.renderAdminPage = (req, res) => {
	res.render('admin/plugins/theme-ga', {
		title: 'Game Achievements Theme',
	});
};

Controllers.renderThemeSettings = async (req, res, next) => {
	const userData = await accountHelpers.getUserDataByUserSlug(req.params.userslug, req.uid, req.query);
	if (!userData) {
		return next();
	}
	const lib = require('./theme');
	userData.theme = await lib.loadThemeConfig(userData.uid);

	userData.title = '[[themes/harmony:settings.title]]';
	userData.breadcrumbs = helpers.buildBreadcrumbs([
		{ text: userData.username, url: `/user/${userData.userslug}` },
		{ text: '[[themes/harmony:settings.title]]' },
	]);

	res.render('account/theme', userData);
};

Controllers.getCategoryCompleteChildren = async cid => await categories.getChildrenCids(cid);
