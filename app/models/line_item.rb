class LineItem < ApplicationRecord
  validates :name, :quantity, :price, presence: true

  def imported?
    name.include?('imported')
  end

  def output
    "#{quantity} #{name}: #{price}"
  end
end
