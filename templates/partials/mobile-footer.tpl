<div component="bottombar" class="bottombar d-flex flex-column d-lg-none fixed-bottom ff-secondary gap-1 align-items-center">

	<!-- IMPORT partials/topic/navigator-mobile.tpl -->

	<div class="bottombar-nav p-2 text-light bg-dark d-flex justify-content-between align-items-center w-100">
		<div class="bottombar-nav-left d-flex gap-3 align-items-center">
			<div>
				<a href="#" role="button" class="nav-link nav-btn d-flex justify-content-between align-items-center position-relative" data-bs-toggle="dropdown">
					<span class="position-relative">
						<i class="fa fa-fw fa-lg fa-bars"></i>
						<span component="unread/count" data-unread-url="{unreadCount.unreadUrl}" class="position-absolute top-0 start-100 translate-middle badge rounded-1 bg-primary {{{ if !unreadCount.mobileUnread }}}hidden{{{ end }}}">{unreadCount.mobileUnread}</span>
					</span>
				</a>
				<ul class="navigation-dropdown dropdown-menu">
					{{{ each navigation }}}
					{{{ if displayMenuItem(@root, @index) }}}
					<li class="nav-item {./class}{{{ if ./dropdown }}} dropend{{{ end }}}" title="{./title}">
						<a class="nav-link nav-btn navigation-link px-3 py-2 {{{ if ./dropdown }}}dropdown-toggle{{{ end }}}"
						{{{ if ./dropdown }}} href="#" role="button" data-bs-toggle="collapse" data-bs-target="#collapse-target-{@index}" onclick="event.stopPropagation();" {{{ else }}} href="{./route}"{{{ end }}} {{{ if ./id }}}id="{./id}"{{{ end }}}{{{ if ./targetBlank }}} target="_blank"{{{ end }}}>
							<span class="d-inline-flex justify-content-between align-items-center w-100">
								<span class="text-nowrap">
									{{{ if ./iconClass }}}
									<i class="fa fa-fw {./iconClass}" data-content="{./content}"></i>
									{{{ end }}}
									{{{ if ./text }}}
									<span class="nav-text px-2 fw-semibold">{./text}</span>
									{{{ end }}}
								</span>
								<span component="navigation/count" class="badge rounded-1 bg-primary {{{ if !./content }}}hidden{{{ end }}}">{./content}</span>
							</span>
						</a>
						{{{ if ./dropdown }}}
						<div class="ps-3">
							<ul id="collapse-target-{@index}" class="collapse list-unstyled ps-3">
								{./dropdownContent}
							</ul>
						</div>
						{{{ end }}}
					</li>
					{{{ end }}}
					{{{ end }}}
				</ul>
			</div>
		</div>
	</div>
</div>