module Environment
	extend self

	def url
		raise "The environment variable URL was not defined in command line" if ENV['URL'].nil?
		ENV['URL']
	end
end