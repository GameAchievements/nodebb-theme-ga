{{{ if (config.searchEnabled && user.privileges.search:content) }}}
<li style="list-style-type: none" component="sidebar/search" class="nav-item dropdown"  title="[[global:header.search]]">
<!-- IMPORT partials/header/icons/search.tpl -->
</li>
{{{ end }}}

{{{ if canChat }}}
<li style="list-style-type: none" class="nav-item"  title="[[global:header.chats]]">
<!-- IMPORT partials/header/icons/chats.tpl -->
</li>
{{{ end }}}

<li style="list-style-type: none" component="notifications" class="nav-item" title="[[global:header.notifications]]">
<!-- IMPORT partials/header/icons/notifications.tpl -->
</li>