Given(/^I go to Superstars$/) do
  visit HomePage
end

When(/^I click on sign in$/) do
	on(HomePage).signin
  on(GoogleAccountPage)
end

When(/^I sign in with invalid (email|password|user)$/) do | invalid_field |
  on(GoogleAccountPage).login(invalid_field)
  if @current_page.authorize_access_element.visible?
    @current_page.wait_until(20,'ERROR') { @current_page.authorize_access_element.enabled? }
    @current_page.authorize_access_element.click 
  end
end

When(/^I sign in as a (new|valid) user$/) do |user_type|
  case user_type
  when 'new'
    on(GoogleAccountPage).login(user_type)
  else
    on(GoogleAccountPage).login
  end
end

Then(/^I should see an error message for invalid (email|password)$/) do | invalid_field |
  case invalid_field
  when 'user'
    on(GoogleAccountPage) do |page|
      page.user_email_element.visible? 
      page.email_error_element.visible?
    end
  when 'password'
    on(GoogleAccountPage) do |page|
      page.user_password_element.visible?
      page.password_error_element.visible?
    end
  end
end

Then(/^I should be navigated to Superstars home page as (registered|unregistered) user$/) do |option|
  case option
  when 'registered'
    on(HomePage) do |page|
      page.user_page_element.visible?
    end
  when 'unregistered'
    on(HomePage) do |page|
      page.signin_page_element.visible?
      page.signin_element.visible?
    end
  end
end

Then(/^I should see first access dialog$/) do
  on(FirstAccessDialog)
end

Then(/^I should see "(.*?)" cookie present$/) do |cookie_name|
  @browser.manage.cookie_named(cookie_name).nil?.should be false
end

When(/^I search for "(.*?)"$/) do |keyword|
  on(HeaderPanel).search_for_term(keyword)
end

Then(/^I should not see any valid result$/) do 
  on(ZeroSearchResultsPage)
end 

Then(/^I should see at least one result$/) do 
  on(HomePage).profile_elements.count.should be > 0
end 