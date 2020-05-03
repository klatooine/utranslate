# frozen_string_literal: true

module Utranslate
  class HashValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.is_a?(Hash)

      record.errors[attribute] << 'Incorrect format for translated column, should be a hash.'
    end
  end
end
