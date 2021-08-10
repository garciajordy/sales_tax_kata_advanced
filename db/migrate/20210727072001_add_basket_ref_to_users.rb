class AddBasketRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :basket, null: false, foreign_key: true
  end
end
