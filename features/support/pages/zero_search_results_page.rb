class ZeroSearchResultsPage
	include PageObject

	#"http://superstars.avenuecode.com"
	#http://staging-superstars.avenuecode.com:3030/#!/

	expected_element					div		:zero_results,	:class => 'no-results'

	def initialize_page
		has_expected_element?
	end
end
