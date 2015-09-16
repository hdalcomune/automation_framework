module Browser

	def self.setup_browser
		ENV['BROWSER'] = 'firefox' if ENV['BROWSER'].nil?
		browser_name = ENV['BROWSER'].downcase.to_sym

    if(browser_name == :chrome)
    	browser=Selenium::WebDriver.for :chrome
    else
			browser=Selenium::WebDriver.for browser_name
		end
	end
end

