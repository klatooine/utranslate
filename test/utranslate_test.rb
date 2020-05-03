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

    test '#translate should mount translations in translatable field' do
      Post.class_eval do
        translate :title
      end
    end

    test '#translate should allow add translations for current locale' do
      Post.class_eval do
        translate :title
      end

      title = 'utranslation'

      post = Post.new
      post.title = title

      assert_equal post[:title][I18n.locale.to_s], title
    end

    test '#translate should allow to add translations for other locale' do
      Post.class_eval do
        translate :title
      end

      title = 'utranslation'

      post = Post.new
      post.title(:es, title)

      assert_equal post[:title]['es'], title
    end

    test '#translate should allow to mass assign translations' do
      Post.class_eval do
        translate :title
      end

      translations = { es: 'utranslation_es', en: 'utranslation_en' }

      post = Post.new(title: translations)

      assert_equal post[:title]['es'], translations[:es]
      assert_equal post[:title]['en'], translations[:en]
    end

    test '#translate should keep translated column format after translation added' do
      Post.class_eval do
        translate :title
      end

      title = 'utranslation'

      post = Post.new

      post.title(:es, title)

      assert post[:title].is_a?(Hash)
    end

    test '#translate accepts to activate a validator to check for presence of available locales' do
      Post.class_eval do
        translate :title, null: false
      end

      title = 'utranslation'

      post = Post.new

      post.title(:es, title)

      assert_not post.valid?
      assert post.errors[:title].present?
    end

    test '#translate accepts to activate a validator to check for presence of given locales' do
      Post.class_eval do
        translate :title, null: false, locales: [:es]
      end

      title = 'utranslation'

      post = Post.new

      post.title = title

      assert_not post.valid?
      assert post.errors[:title].present?
    end

    test '#translate should add a format validation for translated column' do
      Post.class_eval do
        translate :title, null: false
      end

      post = Post.new(title: 'test')

      assert_not post.valid?
      assert post.errors[:title].present?
    end
  end
end
