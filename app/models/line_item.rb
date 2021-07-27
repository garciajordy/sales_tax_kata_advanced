class LineItem < ApplicationRecord
  validates :name, :quantity, :price, presence: true

  belongs_to :basket

  def imported?
    name.include?('imported')
  end

  def output
    "#{quantity} #{name}: #{LineItem.to_decimal(price)}"
  end

  def self.to_decimal(num)
    '%.2f' % num
  end
end
