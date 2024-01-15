
            </div><!-- /.container#content -->

            <div class="container-lg d-flex flex-column gap-3 ga-footer">
                <div class="row text-center mb-2">
                    <div class="col-12">
                        <a href="/"><img id="footer-logo" src="/plugins/nodebb-theme-ga/images/footer-logo.png" alt="GA Footer Logo"/></a>
                    </div>
                </div>
                <div class="row px-md-5">
                    <div class="col-md-3">
                        <ul>
                            <li><a href="https://gameachievements.net/">Home</a></li>
                            <li><a href="https://gameachievements.net/news">News</a></li>
                            <li><a href="https://gameachievements.net/games">Games</a></li>
                            <li class="nested"><a class="secondary-link" href="https://gameachievements.net/#gas-list-top">Popular Right Now</a></li>
                            <li class="nested"><a class="secondary-link" href="https://gameachievements.net/games">All Games</a></li>
                            <li><a href="https://gameachievements.net/ga-leaderboard">Leaderboards</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <ul>
                            <li><a href="https://gameachievements.net/guides">Guides</a></li>
                            <li><a href="https://gameachievements.net/achievements">Achievements</a></li>
                            <li class="nested"><a class="secondary-link" href="https://gameachievements.net/achievements">All Achievements</a></li>
                            <li><a href="https://gameachievements.net/ga-reviews">Game Reviews</a></li>
                            <li><a href="https://gameachievements.net/linking-unlinking-platform-accounts">Linking Your Platforms</a></li>     
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <ul>
                            <li><a href="/">Forums</a></li>
                            <li><a href="#">Become Premium</a></li>
                            <li><a href="#">Coming Soon</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3">
                        <ul>
                            <li><a href="https://gameachievements.net/about-us">About Us</a></li>
                            <li><a href="https://gameachievements.net/privacy-policy">Our Privacy Policy</a></li>
                            <li><a href="https://gameachievements.net/terms-of-use">Terms Of Use</a></li>
                            <li><a href="#">Follow Us</a></li>
                            <li class="nested"><a class="secondary-link" href="https://twitter.com/G_Achievements"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</a></li>
                            <li class="nested"><a class="secondary-link" href="https://www.instagram.com/GAchievements/"><i class="fa fa-instagram" aria-hidden="true"></i> Instagram</a></li>
                            <li><a href="mailto:contact@gameachievements.net?subject=%5BSite%20Contact%5D">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row text-center my-4">
                    <div class="col-12">
                        <span class="copyright-text text-white">&copy; All rights reserved to GAME ACHIEVEMENTS.</span>
                    </div>
                </div>
            </div>

		</main>
	</div>
	<!-- IMPORT partials/mobile-footer.tpl -->
	{{{ if !isSpider }}}
	<div class="">
		<div component="toaster/tray" class="alert-window fixed-bottom mb-5 mb-md-2 me-2 me-md-5 ms-auto" style="width:300px; z-index: 1090;">
			<!-- IMPORT partials/reconnect-alert.tpl -->
		</div>
	</div>
	{{{ end }}}

	<!-- IMPORT partials/footer/js.tpl -->
</body>
</html>
