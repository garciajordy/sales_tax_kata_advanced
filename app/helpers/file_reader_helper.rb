module FileReaderHelper
  def file_reader(file)
    File.readlines(file).each do |line|
      line_constructor(line)
    end
  end

  def line_constructor(line)
    {
      quantity: line[0],
      name: line.split(' at ')[0][2..-1],
      price: line.split(' at ')[1]
    }
  end
end