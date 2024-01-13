# frozen_string_literal: true

class AddYomiToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :yomi, :string
  end
end
