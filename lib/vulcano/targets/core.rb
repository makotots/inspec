# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/modulator'

module Vulcano
  module Targets
    extend Modulator

    def self.__resolve(items)
      items.map do |_|
        # @TODO
      end.flatten
    end

    def self.resolve(targets)
      Array(targets).map do |target|
        handler = modules.values.find { |m| m.handles?(target) }
        if handler.nil?
          fail "Don't know how to handle target: #{target}"
        end
        handler.resolve(target)
      end.flatten
    end
  end
end
