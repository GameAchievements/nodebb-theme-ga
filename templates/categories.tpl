<div data-widget-area="header">
	{{{ each widgets.header }}}
	{{widgets.header.html}}
	{{{ end }}}
</div>
<div class="container-fluid hero-main align-items-center">
    <div class="hero-container p-5">
        <h2 class="ga-header-2 text-uppercase text-white">Game Achievements</h1>
        <h2 class="ga-header-2 text-purple-200 text-uppercase">Official Forums</h1>
        <h4 class="text-uppercase">
            <span class="ga-header-4-regular text-white">Complete games, earn achievements and</span><span class="ga-header-4-bold text-purple-200"> join</br> the biggest gamer community in the world.</span>
        </h3>
        <span>
		{{{ if !config.loggedIn }}}
		<div class="text-center">
        	<button type="button" class="ga-hero-button join-button mt-4 border-0" onclick="location.href='/login'">Join the community</button>
		</div>
		{{{ end }}}
    </div>
</div>
<div class="row py-2">
	<div class="{{{ if widgets.sidebar.length }}}col-lg-9 col-sm-12{{{ else }}}col-lg-12{{{ end }}}">
		{{{ if pagination.pages.length }}}
		<div><!-- IMPORT partials/category/selector-dropdown-left.tpl --></div>
		{{{ end }}}
		<ul class="categories-list list-unstyled" itemscope itemtype="http://www.schema.org/ItemList">
			{{{ each categories }}}
			<!-- IMPORT partials/categories/item.tpl -->
			{{{ end }}}

			{{{ if (config.loggedIn && !loggedInUser.isPremium) }}}
			<li component="categories/category" class="w-100 my-4 p-3 py-3 py-lg-4 gap-lg-0 gap-2 rounded rounded-ga border border-1 border-ga bg-gradient-ga d-flex flex-column align-items-start">
				<div class="d-flex col-lg-12 gap-2 gap-lg-3 align-content-center">
					<div class="flex-shrink-0 my-auto p-3 text-purple-700">
						<i class="fa fa-lock fa-4x"></i>
					</div>
					<div class="flex-grow-1 d-flex flex-wrap gap-1">
						<h2 class="title text-break text-uppercase fs-4 fw-semibold m-0 tracking-tight w-100">Premium</h2>
						<div class="description text-sm w-100">
							This forum section is exclusive of Premium Members. 
							This section includes discussion regarding premium features and other topics. 
							You can access it by becoming a Premium Member. This will give you premium benefits
							 such as Forum Special Tags and Premium Section access.
						</div>
					</div>
				</div>
				<button type="button" class="mx-auto ga-hero-button join-button mt-2 border-0" onclick="location.href='https://gameachievements.net/'">Become premium</button>
			</li>
			{{{ end }}}
		</ul>

		<!-- IMPORT partials/paginator.tpl -->
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 {{{ if !widgets.sidebar.length }}}hidden{{{ end }}}">
		{{{ each widgets.sidebar }}}
		{{widgets.sidebar.html}}
		{{{ end }}}
	</div>
</div>
<div data-widget-area="footer">
	{{{ each widgets.footer }}}
	{{widgets.footer.html}}
	{{{ end }}}
</div>
