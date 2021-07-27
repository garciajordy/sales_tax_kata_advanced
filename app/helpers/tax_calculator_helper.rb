module TaxCalculatorHelper
  def total_sales_tax
    to_decimal(rounding(line_items.sum(&:tax_calculator)))
  end

  def sales_tax
    rounding(tax_calculator)
  end

  def tax_calculator
    (price * tax_percent) / 100
  end

  def tax_percent
    total = 0
    total += 5 if imported?
    total += 10 if category == 'others'
    total
  end

  def to_decimal(num)
    format('%.2f', num)
  end

  def rounding(num)
    num = num.round(2)
    remainder = num % 0.05
    return num if remainder.zero?

    (num + (0.05 - remainder)).round(2)
  end
end
