require 'active_support/concern'

module EnumAttribute
  extend ActiveSupport::Concern

  included do
    define_singleton_method :enum_attribute do |attribute, values|
      better_values = (values.is_a?(Hash) ? values : Hash[values.map.with_index{|s, i| [s, i]}]).with_indifferent_access
      enum attribute => better_values
      better_values
    end
  end

end