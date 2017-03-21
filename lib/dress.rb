class Dress
  attr_reader :item, :type, :temp

  TEMP_MASK = /[\+\-\d]+/

  def initialize(item, type, temp)
    @item = item
    @type = type
    @temp = to_range!(temp)
  end

  def to_range!(temp)
    t_min = temp.slice!(TEMP_MASK)
    t_max = temp.slice!(TEMP_MASK)
    Range.new(t_min.to_i, t_max.to_i)
  end
end
