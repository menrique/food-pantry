require 'active_support/concern'

module Stateful
  extend ActiveSupport::Concern
  include EnumAttribute

  included do
    define_singleton_method :stateful do |attribute = :status, values|
      enum_attribute attribute, values
    end
  end

end