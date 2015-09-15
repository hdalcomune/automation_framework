Before do |scenario|
	@browser=Browser.setup_browser
	@browser.manage.window.maximize
end

After do |scenario|
	if scenario.failed?
		@browser.save_screenshot "./#{Time.now.strftime("log/#{scenario.name}_%Y%m%d-%H%M%S")}.png"
		embed "./#{Time.now.strftime("log/#{scenario.name}_%Y%m%d-%H%M%S")}.png", 'image/png'
		binding.pry
	end
  @browser.close
end