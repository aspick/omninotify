require "omninotify/version"

module Omninotify
	def notify(message, options = {})
		# retrieve all targets from config
		targets = [Omninotify::LineNotify.class]

		if options[:targets] != nil
			target_keys = options[:targets]
			target_keys = [target_keys] if target_keys.class == Symbol

			targets = targets.select do |target_class|
				target_keys.includes?(target_class.key)
			end
		end

		targets.map{|target| target.notify(message, options)}
	end
end
