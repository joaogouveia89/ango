module Services
	class Message
		def initialize(message, bootstrap_bg)
			@message = message
			@bootstrap_bg = bootstrap_bg
		end

		def message
			@message
		end
		def bootstrap_bg
			@bootstrap_bg
		end
	end
end