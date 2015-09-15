class GoogleAccountPage
	include PageObject

	text_field	:user_email, 				:id => 'Email'
	text_field	:user_password,			:id => 'Passwd'
	button			:confirm_email, 		:id => 'next'
	button			:user_signin, 			:id => 'signIn'
	span				:email_error,				:id => 'errormsg_0_Email-msg'
	span				:password_error,		:id => 'errormsg_0_Password-msg'
	button			:authorize_access,	:id => 'submit_approve_access'

	def initialize_page
		wait_until(20, "ERROR: Google Account Login page not loaded"){ user_email_element.visible? ||  user_password_element.visible?}
	end

	def login(invalid_field='none')
		user = YAML::load_file('config/data/user.yml')
	  case invalid_field
	  when 'email'
	  	self.user_email = user['invalid_account']['login']
	  	confirm_email
	  when 'password'
	  	self.user_email = user['valid_account']['login']
	  	confirm_email
		  self.user_password_element.when_visible(10)
		  user_password = user['valid_account']['invalid_password']
		  user_signin
		when 'user'
			self.user_email = user['unauthorized_account']['login']
	  	confirm_email
		  user_password_element.when_visible(10)
		  self.user_password = user['unauthorized_account']['password']
		  user_signin
		  authorize_access_element.when_visible(10)
		  authorize_access
		when 'new'
			user = YAML::load_file('config/data/user.yml')
			self.user_email = user['new_account']['login']
	  	confirm_email
		  user_password_element.when_visible(10)
		  self.user_password = user['new_account']['password']
		  user_signin
		else
			user = YAML::load_file('config/data/user.yml')
			self.user_email = user['valid_account']['login']
	  	confirm_email
		  user_password_element.when_visible(10)
		  self.user_password = user['valid_account']['password']
		  user_signin
		end
	end
	
end
