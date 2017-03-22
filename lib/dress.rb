class Dress
  attr_reader :item, :type, :temperature

  def initialize(item, type, temprerature)
    @item = item
    @type = type
    @temperature = convert_to_range(temprerature)
  end

  def warm?(temperature)
    @temperature.include?(temperature)
  end

  def convert_to_range(temperature)
    t_min, t_max = *temperature.gsub(/[()]/, '').split(', ')
    Range.new(t_min.to_i, t_max.to_i)
  end
end
