require "omninotify/version"

module Omninotify

	autoload :Base, 'omninotify/base'

	def self.notify(message, options = {})
		# retrieve all targets from config
		target_keys = nil
		if options[:targets] != nil
			target_keys = options[:targets]
			target_keys = [target_keys] if target_keys.class == Symbol
		end

		targets = []
		@@targets.each do |target_instance|
			if target_keys == nil || target_keys.includes?(target_instance.class.key)
				targets << target_instance
			end
		end

		targets.map{|target| target.notify(message, options)}
	end

	def self.config(&block)
		instance_eval &block
	end

	def self.target(target_instance)
		@@targets ||= []
		@@targets << target_instance
	end
end
