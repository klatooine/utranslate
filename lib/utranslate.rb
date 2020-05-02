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
    end
  end
end
