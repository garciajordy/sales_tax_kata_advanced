class Basket < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy

  def output
    line_items.map(&:output)
  end

  def total
    line_items.map(&:price).sum.round(2)
  end
end
