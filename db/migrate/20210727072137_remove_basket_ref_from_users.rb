class RemoveBasketRefFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :basket, null: false, foreign_key: true
  end
end
