class Basket < ApplicationRecord
  include TaxCalculatorHelper

  belongs_to :user

  has_many :line_items, dependent: :destroy

  def output
    line_items.map(&:output)
  end

  def total
    line_items.sum(&:price).round(2)
  end
end
