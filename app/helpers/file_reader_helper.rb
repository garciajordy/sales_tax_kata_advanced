module FileReaderHelper
  def file_reader(file)
    basket = current_user.baskets.create(name: file.original_filename.split('.').first)
    File.readlines(file).each do |line|
      line_item_constructor(line_constructor(line), basket.id)
    end
    basket
  end

  def line_constructor(line)
    {
      quantity: line[0].to_i,
      name: line.split(' at ')[0][2..],
      price: line.split(' at ')[1].to_f
    }
  end

  def line_item_constructor(hash, id)
    LineItem.create(quantity: hash[:quantity], name: hash[:name], price: hash[:price], basket_id: id)
  end
end
