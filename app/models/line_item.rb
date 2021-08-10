class LineItem < ApplicationRecord
  include TaxCalculatorHelper
  validates :name, :quantity, :price, presence: true

  belongs_to :basket

  def imported?
    name.include?('imported')
  end

  def output
    "#{quantity} #{name}: #{to_decimal(price + sales_tax)}"
  end

  def category
    return 'food' if ['chocolate'].any? { |item| name.include?(item) }
    return 'books' if ['book'].any? { |item| name.include?(item) }
    return 'medicine' if ['pills'].any? { |item| name.include?(item) }
    return 'others' if %w[music perfume].any? { |item| name.include?(item) }
  end
end
