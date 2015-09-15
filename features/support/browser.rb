module Browser

	def self.setup_browser
		browser_name = ENV['BROWSER']
		browser_name = 'firefox' if browser_name == nil

		case browser_name.downcase
			when 'chrome'
				browser=Selenium::WebDriver.for :chrome	
			when 'ie'
				browser=Selenium::WebDriver.for :ie
			when 'safari'
				browser=Selenium::WebDriver.for :safari
			when 'firefox'
				browser=Selenium::WebDriver.for :firefox
			else
				raise "Invalid browser"
		end
	end
end

