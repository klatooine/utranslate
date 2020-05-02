# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.jsonb :title, null: false, default: {}
      t.string :not_translated

      t.timestamps
    end
  end
end
