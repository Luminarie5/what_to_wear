class Dress
  attr_reader :item, :type, :temperature

  def initialize(item_stats)
    @item = item_stats[0]
    @type = item_stats[1]
    @temperature = convert_to_range(item_stats[2])
  end

  def warm?(temperature)
    @temperature.include?(temperature)
  end

  def convert_to_range(temperature)
    t_min, t_max = *temperature.gsub(/[()]/, '').split(', ')
    Range.new(t_min.to_i, t_max.to_i)
  end
end
