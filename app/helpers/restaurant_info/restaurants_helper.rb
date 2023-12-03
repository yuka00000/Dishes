module RestaurantInfo::RestaurantsHelper
  def decorate_for_select(ary)
    count = ary.size
    #ary.map.with_index(1) do |o, i|: 配列 ary の各要素 o とそのインデックス i に対して、ブロック内の処理を行う
    ary.map.with_index(1) do |o, i|
      #if i == 1: インデックスが1の場合、[number_to_currency(o) + "以下", o] を配列に追加。
      if i == 1
        [number_to_currency(o) + "以下", o]
      #インデックスが ary の要素数と一致する場合、[number_to_currency(o) + "以上", o] を配列に追加
      elsif i == count
        [number_to_currency(o) + "以上", o]
      else
        [number_to_currency(o), o]
      end
    end
  end
  
  #引数で与えられた price を通貨の形式にフォーマットする。例えば 1000000 は "1,000,000円" に変換される。
  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
