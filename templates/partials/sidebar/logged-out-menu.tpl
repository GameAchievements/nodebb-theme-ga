
	<a class="nav-link nav-btn" href="{relative_path}/login">
		<span class="d-flex gap-2 align-items-center text-nowrap truncate-open">
			<span class="position-relative">
				<i class="fa fa-fw fa-sign-in"></i>
			</span>
			<span class="nav-text small visible-open fw-semibold">[[global:login]]</span>
		</span>
	</a>
{{{ if allowRegistration }}}
	<a class="nav-link nav-btn" href="{relative_path}/register">
		<span class="d-flex gap-2 align-items-center text-nowrap truncate-open">
			<span class="position-relative">
				<i class="fa fa-fw fa-user-plus"></i>
			</span>
			<span class="nav-text small visible-open fw-semibold">[[global:register]]</span>
		</span>
	</a>
{{{ end }}}