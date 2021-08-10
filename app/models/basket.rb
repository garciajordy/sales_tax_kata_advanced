class Basket < ApplicationRecord
  include TaxCalculatorHelper
  validates :name, presence: true

  belongs_to :user

  has_many :line_items, dependent: :destroy

  def output
    line_items.map(&:output) << "Sales tax: #{total_sales_tax}" << "Total: #{total}"
  end

  def total
    (line_items.sum(&:price) + total_sales_tax.to_f).round(2)
  end
end
