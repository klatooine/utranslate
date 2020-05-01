# frozen_string_literal: true

require 'test_helper'

module Utranslate
  class Test < ActiveSupport::TestCase
    test 'truth' do
      assert_kind_of Module, Utranslate
    end
  end
end
