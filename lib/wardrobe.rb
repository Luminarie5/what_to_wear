class Wardrobe
  require_relative 'dress.rb'

  def initialize
    @clothing = []
  end

  def find_clothing(path_to_clothes)
    Dir.new(path_to_clothes).each do |clothes_name|
      file_path = path_to_clothes + clothes_name
      if File.file?(file_path)
        lines = File.readlines(file_path, encoding: 'utf-8').map! { |line| line.chomp.encode('utf-8') }
        @clothing << Dress.new(lines[0], lines[1], lines[2])
      end
    end
    raise 'Empty wardrobe! No clothes ;(' if @clothing.empty?
  rescue RuntimeError => error
    puts error.inspect
    exit
  end

  def sort_by_temp(needed_temp)
    warm_clothing = []
    @clothing.each { |dress| warm_clothing << dress if dress.temp.include?(needed_temp) }
    warm_clothing
  end

  def choose_clothes(clothing)
    clothing_for_wear = []
    sort_by_type(clothing).each do |type|
      sorted_clothing = []
      clothing.each { |dress| sorted_clothing << dress if type.include?(dress.type) }
      clothing_for_wear << sorted_clothing.sample
    end
    clothing_for_wear
  end

  def sort_by_type(clothing)
    types = []
    clothing.each { |dress| types << dress.type }
    types.uniq
  end
end
