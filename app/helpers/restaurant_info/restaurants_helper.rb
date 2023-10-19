module RestaurantInfo::RestaurantsHelper
  def decorate_for_select(ary)
    count = ary.size
    ary.map.with_index(1) do |o, i|
      if i == 1
        [number_to_currency(o) + "以下", o]
      elsif i == count
        [number_to_currency(o) + "以上", o]
      else
        [number_to_currency(o), o]
      end
    end
  end
  
  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
