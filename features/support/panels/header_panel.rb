class HeaderPanel
	include PageObject

	page_url Environment.url
	#"http://superstars.avenuecode.com"
	#http://staging-superstars.avenuecode.com:3030/#!/

	a 					:my_profile,	:href => '/#!/profile/'
	a 					:signout,			:href => '/auth/signout/'
	header			:navbar,			:class => 'navbar'
	text_field	:search_bar,	:class => 'navbar-search'

	def search_for_term(keyword)
		self.search_bar_element.when_visible.click
		self.search_bar = keyword
	end
end
