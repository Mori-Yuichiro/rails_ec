class ChangeColumnFromOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :email, :string, null: false
  end
end
