class LineItem < ApplicationRecord
  validates_presence_of :name, :quantity, :price

  def imported?
    name.include?("imported")
  end
end
