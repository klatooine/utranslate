# frozen_string_literal: true

module Utranslate
  class AllTranslationsValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, _)
      locales = options.fetch(:locales)

      return unless missing_translations?(locales)

      record.errors[attribute] << "#{missing_translations} translations not present for #{attribute}"
    end

    private

    def missing_translations?(locales)
      locales.each do |locale|
        missing_translations << locale unless locale_present?
      end

      !missing_translations.length.zero?
    end

    def missing_translations
      @_missing_translations ||= []
    end

    def locale_present?
      false
    end
  end
end
