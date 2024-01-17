{{{ if (brand:logo || config.showSiteTitle)}}}
<nav class="navbar navbar-expand-xxl header-gradient-ga">
  <div class="container-lg p-0">
    {{{ if brand:logo }}}
			<a class="me-3 p-2" component="navbar-brand" href="{{{ if brand:logo:url }}}{brand:logo:url}{{{ else }}}{relative_path}/{{{ end }}}">
				<img component="brand/logo" alt="{brand:logo:alt}" class="{brand:logo:display}" src="{brand:logo}?{config.cache-buster}" />
			</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto m-0 align-items-lg-center">
        <li class="nav-item button-header">
          <a href="https://gameachievements.net/games" class="fs-6 fw-bold text-uppercase p-3 nav-link">Games</a>
        </li>
        <li class="nav-item button-header">
          <a href="https://gameachievements.net/achievements" class="fs-6 fw-bold text-uppercase p-3 nav-link">Achievements</a>
        </li>
		<li class="nav-item button-header">
          <a href="https://gameachievements.net/guides" class="fs-6 fw-bold text-uppercase p-3 nav-link">Guides</a>
        </li>
        <li class="nav-item dropdown button-header">
          <a class="nav-link dropdown-toggle fs-6 fw-bold text-uppercase p-3 nav-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Leaderboards <i class="fa-solid fa-chevron-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">GA Leaderboard</a></li>
            <li><a class="dropdown-item" href="#">Playstation</a></li>
			      <li><a class="dropdown-item" href="#">Steam</a></li>
			      <li><a class="dropdown-item" href="#">Xbox</a></li>
          </ul>
        </li>
		<li class="nav-item button-header">
          <a href="https://gameachievements.net/news" class="fs-6 fw-bold text-uppercase p-3 mb-0 nav-link">News</a>
       
        <li class="nav-item button-header button-gradient-ga">
		<a href="{{{ if brand:logo:url }}}{brand:logo:url}{{{ else }}}{relative_path}/{{{ end }}}" class="fs-6 fw-bold text-uppercase mb-0 p-3 text-header-selected nav-link">Forums</a>
     </li>
      </ul>

      <div class="d-flex gap-4 align-items-center justify-content-between p-3">
      {{{ if config.loggedIn }}}
        <!-- IMPORT partials/header/user-wrapper.tpl -->
        <a class="me-4">{buildAvatar(user, "32px", true)}</a>
          <li class="nav-item dropdown" style="list-style-type: none">
            <a class="nav-link dropdown-toggle fs-6 fw-bold text-uppercase text-header" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              {user.username} <i class="fa-solid fa-chevron-down"></i>
            </a>
            <!-- IMPORT partials/sidebar/user-menu.tpl -->
	{{{ else }}}
	<!-- IMPORT partials/sidebar/logged-out-menu.tpl -->
	{{{ end }}}
					{{{ end }}}
          </li>
      </div>
	  
		{{{ if widgets.brand-header.length }}}
		<div data-widget-area="brand-header" class="flex-fill gap-3 p-2 align-self-center">
			{{{each widgets.brand-header}}}
			{{./html}}
			{{{end}}}
		</div>
		{{{ end }}}
	</div>
</div>
</nav>
{{{ end }}}