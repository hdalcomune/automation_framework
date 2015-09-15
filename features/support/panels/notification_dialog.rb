class FirstAccessDialog
	include PageObject

	div			:complete_profile_dialog,	:class => 'modal-content'
	button 	:complete_profile, 				:xpath => "//div[@class='modal-footer']/button[@ng-click='ok()']"
	#button 	:complete_profile, 				:text => 'complete my profile'
	button 	:complete_later, 					:text => "//div[@class='modal-footer']/button[@ng-click='cancel()']"

	expected_element :complete_profile_dialog

	def initialize_page 
		has_expected_element?
	end

end