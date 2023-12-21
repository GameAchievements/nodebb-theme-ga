<div class="btn-group bottom-sheet">
	<button type="button" class="btn btn-light dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<i class="fa fa-gear fa-fw"></i>
	</button>
	<ul class="dropdown-menu dropdown-menu-end p-1 text-sm account-sub-links">
		<li>
			<a class="dropdown-item rounded-1" href="{config.relative_path}/user/{userslug}/info">[[user:account-info]]</a>
		</li>
		{{{ if (canBan || canMute) }}}
		<li role="separator" class="dropdown-divider"></li>
		{{{ end }}}
		{{{ if canBan }}}
		<li class="{{{ if banned }}}hide{{{ end }}}">
			<a class="dropdown-item rounded-1" component="account/ban" href="#">[[user:ban-account]]</a>
		</li>
		<li class="{{{ if !banned }}}hide{{{ end }}}">
			<a class="dropdown-item rounded-1" component="account/unban" href="#">[[user:unban-account]]</a>
		</li>
		{{{ end }}}
		{{{ if canMute }}}
		<li class="{{{ if muted }}}hide{{{ end }}}">
			<a class="dropdown-item rounded-1" component="account/mute" href="#">[[user:mute-account]]</a>
		</li>
		<li class="{{{ if !muted }}}hide{{{ end }}}">
			<a class="dropdown-item rounded-1" component="account/unmute" href="#">[[user:unmute-account]]</a>
		</li>
		{{{ end }}}
		{{{ if isAdmin }}}
		<li>
			<a component="account/delete-account" href="#" class="dropdown-item rounded-1">[[user:delete-account-as-admin]]</a>
			<a component="account/delete-content" href="#" class="dropdown-item rounded-1">[[user:delete-content]]</a>
			<a component="account/delete-all" href="#" class="dropdown-item rounded-1">[[user:delete-all]]</a>
		</li>
		{{{ end }}}
	</ul>
</div>
