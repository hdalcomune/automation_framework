class HomePage
	include PageObject

	page_url Environment.url
	#"http://superstars.avenuecode.com"
	#http://staging-superstars.avenuecode.com:3030/#!/

	div					:signin_page,	:class => 'signin-screen'
	button 			:signin, 			:class => 'signin-btn'

	div					:user_page,		:class => 'home-page-content'
	a 					:my_profile,	:href => '/#!/profile/'
	a 					:signout,			:href => '/auth/signout/'
	divs				:profile, 		:class => 'hexagon-profile'

	def initialize_page
		wait_until(20, "ERROR: Home Page not loaded"){ signin_page_element.visible? ||  user_page_element.visible? }
	end
end
