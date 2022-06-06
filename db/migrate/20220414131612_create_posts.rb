# frozen_string_literal: true

# Migration to populate the posts table
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :text
      t.integer :likes, default: 0
      t.integer :reads, default: 0
      t.float :popularity, default: 0.0
      t.string :tags
    end
  end
end
