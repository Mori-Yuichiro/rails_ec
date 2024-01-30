# frozen_string_literal: true

class ChangeColumnFromOrder < ActiveRecord::Migration[7.0]
  def up
    change_column :orders, :email, :string
  end
end
