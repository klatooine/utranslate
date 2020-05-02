# frozen_string_literal: true

require 'utranslate/railtie'
require 'utranslate/errors/column_not_present_error'
require 'utranslate/errors/invalid_format_error'

module Utranslate
  extend ActiveSupport::Concern

  class_methods do
    def translate(attr_name)
      raise Utranslate::ColumnNotPresentError, "ERROR: #{attr_name} not present in #{name}." unless column_names.include?(attr_name.to_s)
      raise Utranslate::InvalidFormatError, "ERROR: #{attr_name} not a valid JSONB column." unless type_for_attribute(attr_name).type == :jsonb

      define_method "utranslate_#{attr_name}" do |locale, value|
        self[:"#{attr_name}"][locale.to_s] = value
      end

      define_method attr_name.to_s do |locale = I18n.locale, value = nil|
        if value.present?
          send(:"utranslate_#{attr_name}", locale, value)
        else
          self[:"#{attr_name}"][locale.to_s]
        end
      end

      define_method "#{attr_name}=" do |value|
        if value.is_a?(Hash)
          self[:"#{attr_name}"] = value
        else
          send(:"utranslate_#{attr_name}", I18n.locale, value)
        end
      end
    end
  end
end
