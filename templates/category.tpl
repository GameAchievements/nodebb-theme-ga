{{{ if (parent.name == "Games") }}}
<div class="container-fluid hero-game align-items-center" style="background-image: radial-gradient(#030922, #191F59D6 84%), url({ backgroundImage })">
    <div class="hero-category-container p-5">
        <h4 class="game-header-4 text-uppercase text-white">Game Achievements Forums</h4>
		<h3 class="game-header-3 text-uppercase text-white pt-3">{./name}</h3> 
    </div>
</div>
{{{ else }}}
<div class="container-fluid hero-category {{{ if (name == "Premium Section") }}} hero-premium {{{ end }}} align-items-center">
    <div class="hero-category-container p-5">
        <h3 class="ga-header-2 text-uppercase text-white">Game Achievements</h3>
		{{{ if (name == "Premium Section") }}}
		<h3 class="ga-header-2 text-purple-400 text-uppercase">Premium Forums</h3>
		{{{ else }}} 
			{{{ if (name == "Games") }}}
			<h3 class="ga-header-2 text-purple-200 text-uppercase">All the games, one forum.</h3>
			{{{ else }}}
			<h3 class="ga-header-2 text-purple-200 text-uppercase">Official Forums</h3>
			{{{ end }}}
		{{{ end }}}
    </div>
</div>
{{{ end }}}

{{{ if (parent.name == "Games") }}}
<div class="category-header d-flex flex-column gap-2 {{{ if (name == "Premium Section") }}}category-header-premium{{{ end }}}">
	<div class="game-header-container my-5 mx-5">
		<div class="d-flex gap-2 align-items-center mb-2 w-100 {{{ if config.theme.centerHeaderElements }}}justify-content-center{{{ end }}}">
			<h1 class="tracking-tight fs-2 fw-semibold mb-0 text-uppercase"><span class="game-header-about">About</span> <span class="game-header-name">{./name}</span></h1>
		</div>
		<div class="description w-100 {{{ if config.theme.centerHeaderElements }}}text-center{{{ end }}}">
			{./descriptionParsed}
		</div>
	</div>
	
	<!-- IMPORT partials/breadcrumbs-json-ld.tpl -->
	<!-- IMPORT partials/breadcrumbs.tpl -->

	<div class="d-flex flex-wrap gap-2 mt-2 {{{ if config.theme.centerHeaderElements }}}justify-content-center{{{ end }}}">
		<span class="badge text-body border border-gray-300 stats text-xs">
			<span title="{totalTopicCount}" class="fw-bold">{humanReadableNumber(totalTopicCount)}</span>
			<span class="text-lowercase fw-normal">[[global:topics]]</span>
		</span>
		<span class="badge text-body border border-gray-300 stats text-xs">
			<span title="{totalPostCount}" class="fw-bold">{humanReadableNumber(totalPostCount)}</span>
			<span class="text-lowercase fw-normal">[[global:posts]]</span>
		</span>
	</div>
</div>
{{{ else }}}
<!-- IMPORT partials/breadcrumbs-json-ld.tpl -->
<!-- IMPORT partials/breadcrumbs.tpl -->
<div class="category-header d-flex flex-column gap-2 mt-2 {{{ if (name == "Premium Section") }}}category-header-premium{{{ end }}}">
	{{{ if (name != "Premium Section") }}}
	<div class="d-flex gap-2 align-items-center mb-1 {{{ if config.theme.centerHeaderElements }}}justify-content-center{{{ end }}}">
		<!-- {buildCategoryIcon(@value, "40px", "rounded-1 flex-shrink-0")} -->
		<h1 class="tracking-tight fs-2 fw-semibold mb-0 text-uppercase">{./name}</h1>
	</div>
	{{{ end }}}
	{{{ if (name == "Premium Section") }}}
		{{{ if ./descriptionParsed }}}
		<div class="description text-muted text-sm w-100 {{{ if config.theme.centerHeaderElements }}}text-center{{{ end }}}">
			{./descriptionParsed}
		</div>
		<div class="d-flex gap-2 align-items-center mb-1 {{{ if config.theme.centerHeaderElements }}}justify-content-center{{{ end }}}">
		<h1 class="tracking-tight fs-2 fw-semibold mb-0 text-uppercase">{./name}</h1>
	</div>
		{{{ end }}}
	{{{ end }}}

	<div class="d-flex flex-wrap gap-2 {{{ if config.theme.centerHeaderElements }}}justify-content-center{{{ end }}}">
		<span class="badge text-body border border-gray-300 stats text-xs">
			<span title="{totalTopicCount}" class="fw-bold">{humanReadableNumber(totalTopicCount)}</span>
			<span class="text-lowercase fw-normal">[[global:topics]]</span>
		</span>
		<span class="badge text-body border border-gray-300 stats text-xs">
			<span title="{totalPostCount}" class="fw-bold">{humanReadableNumber(totalPostCount)}</span>
			<span class="text-lowercase fw-normal">[[global:posts]]</span>
		</span>
	</div>
</div>
{{{ end }}}

{{{ if widgets.header.length }}}
<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>
{{{ end }}}


<div class="row mt-3">
	<div class="category d-flex flex-column {{{if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
		<!-- IMPORT partials/category/subcategory.tpl -->
		{{{ if (topics.length || privileges.topics:create) }}}
		<!-- IMPORT partials/topic-list-bar.tpl -->
		{{{ end }}}

		{{{ if (!topics.length && privileges.topics:create) }}}
		<div class="alert alert-info" id="category-no-topics">
			[[category:no-topics]]
		</div>
		{{{ end }}}

		<!-- IMPORT partials/topics_list.tpl -->

		{{{ if config.usePagination }}}
		<!-- IMPORT partials/paginator.tpl -->
		{{{ end }}}
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{ each widgets.sidebar }}}
		{{widgets.sidebar.html}}
		{{{ end }}}
	</div>
</div>
<div data-widget-area="footer">
	{{{each widgets.footer}}}
	{{widgets.footer.html}}
	{{{end}}}
</div>

{{{ if !config.usePagination }}}
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
{{{ end }}}
