<li component="categories/category" data-cid="{./cid}" class="w-100 my-4 p-3 py-3 py-lg-4 gap-lg-0 gap-2 rounded rounded-ga border border-1 border-ga bg-gradient-ga d-flex flex-column flex-lg-row align-items-start category-{./cid} {./unread-class}">
	<meta itemprop="name" content="{./name}">

	<div class="d-flex col-lg-7 gap-2 gap-lg-3 align-content-center">
		<div class="flex-shrink-0 my-auto">
		{buildCategoryIcon(@value, "96px", "rounded-1")}
		</div>
		<div class="flex-grow-1 d-flex flex-wrap gap-1">
			<h2 class="title text-break text-uppercase fs-4 fw-semibold m-0 tracking-tight w-100">
				<!-- IMPORT partials/categories/link.tpl -->
			</h2>
			{{{ if ./descriptionParsed }}}
			<div class="description text-sm w-100">
				{./descriptionParsed}
			</div>
			{{{ end }}}
			{{{ if !config.hideSubCategories }}}
			{{{ if ./children.length }}}
			<div class="category-children row row-cols-2 g-2 my-1 w-100">
				{{{ each ./children }}}
				{{{ if !./isSection }}}
				<span class="category-children-item small">
					{{{ if ./link }}}
					<div class="d-flex align-items-start gap-1">
						<i class="fa fa-fw fa-caret-right text-primary mt-1"></i>
						<a href="{./link}" class="fw-semibold">{./name}</a>
					</div>
					{{{ else }}}
					<div class="d-flex align-items-start gap-1">
						<i class="fa fa-fw fa-caret-right text-primary mt-1"></i>
						<a href="{config.relative_path}/category/{./slug}" class="fw-semibold">{./name}</a>
					</div>
					{{{ end }}}
				</span>
				{{{ end }}}
				{{{ end }}}
			</div>
			{{{ end }}}
			{{{ end }}}
		</div>
	</div>
	{{{ if !./link }}}
		<div class="d-flex col-lg-5 col-12 align-content-stretch">
			<div class="meta stats d-none d-lg-grid col-6 gap-1 pe-2" style="grid-template-columns: 1fr 1fr;">
				<div class="card card-header border-0 p-2 my-auto overflow-hidden rounded-1 d-flex flex-column align-items-center">
					<span class="fs-5 topic-count ff-secondary lh-1 mb-2" title="{./totalTopicCount}">{humanReadableNumber(./totalTopicCount, 0)}</span>
					<span class="d-none topic-count-label d-xl-flex text-uppercase text-xs">[[global:topics]]</span>
					<i class="d-xl-none fa fa-fw text-xs text-muted opacity-75 fa-list"></i>
				</div>
				<div class="card card-header border-0 p-2 my-auto overflow-hidden rounded-1 d-flex flex-column align-items-center">
					<span class="fs-5 post-count ff-secondary lh-1 mb-2" title="{./totalPostCount}">{humanReadableNumber(./totalPostCount, 0)}</span>
					<span class="d-none post-count-label d-xl-flex text-uppercase text-xs">[[global:posts]]</span>
					<i class="d-xl-none fa fa-fw text-xs text-muted opacity-75 fa-message"></i>
				</div>
			</div>
			{{{ if !config.hideCategoryLastPost }}}
			<div component="topic/teaser" class="teaser col-lg-6 col-12 {{{ if !config.theme.mobileTopicTeasers }}}d-none d-lg-block{{{ end }}}">
				<!-- IMPORT partials/categories/lastpost.tpl -->
			</div>
			{{{ end }}}
		</div>
	{{{ end }}}
</li>
