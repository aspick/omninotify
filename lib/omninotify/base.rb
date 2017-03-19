module Omninotify
	class Base
		def notify(message, options = {})
			throw NotImplementedException
		end

		def key
			:base
		end

		def self.inherited(c)
			@@repository ||= []
			@@repository << c
		end
	end
end
