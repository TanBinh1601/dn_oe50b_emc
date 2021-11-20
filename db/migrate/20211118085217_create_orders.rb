class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :total_money
      t.string :status
      t.string :address
      t.string :name_customer
      t.string :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
