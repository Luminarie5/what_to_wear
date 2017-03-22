class Wardrobe
  require_relative 'dress.rb'

  def initialize
    @clothing = []
  end

  def find_clothing(path_to_clothes)
    Dir["#{path_to_clothes}/*.txt"].each do |file_name|
      lines = File.readlines(file_name, encoding: 'utf-8').map { |line| line.chomp }
      @clothing << Dress.new(lines[0], lines[1], lines[2])
    end
    raise 'Empty wardrobe! No clothes ;(' if @clothing.empty?
  rescue RuntimeError => error
    puts error.inspect
  end

  def select_warm_clothing(temperature)
    @clothing.select { |dress| dress.warm?(temperature) }
  end

  def choose_clothing(clothing)
    collect_types(clothing).collect do |types|
      (clothing.select { |item| types.include?(item.type) }).sample
    end
  end

  def collect_types(clothing)
    (clothing.collect { |item| item.type }).uniq
  end
end
