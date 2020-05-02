# frozen_string_literal: true

require 'test_helper'
require 'utranslate/errors/column_not_present_error'
require 'utranslate/errors/invalid_format_error'

module Utranslate
  class Test < ActiveSupport::TestCase
    test 'should raise Utranslate::ColumnNotPresentError if column not present' do
      assert_raises Utranslate::ColumnNotPresentError do
        Post.class_eval do
          translate :doesnt_exist
        end
      end
    end

    test 'should raise Utranslate::InvalidFormatError if column is not jsonb' do
      assert_raises Utranslate::InvalidFormatError do
        Post.class_eval do
          translate :not_translated
        end
      end
    end
  end
end
