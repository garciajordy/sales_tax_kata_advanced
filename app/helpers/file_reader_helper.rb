module FileReaderHelper
  def file_reader(file)
    puts file.original_filename.split(".").first
    File.readlines(file).each do |line|
      line_item_constructor(line_constructor(line))
    end
  end

  def line_constructor(line)
    {
      quantity: line[0].to_i,
      name: line.split(' at ')[0][2..],
      price: line.split(' at ')[1].to_f
    }
  end

  def line_item_constructor(hash)
    LineItem.create(quantity: hash[:quantity], name: hash[:name], price: hash[:price])
  end
end
