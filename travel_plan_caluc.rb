require "pry"
class Plan
  attr_accessor :place, :price 
  def initialize(place:, price:)
    @place = place
    @price = price
  end

  def info_plan(place,price)
    "#{@place}旅行 #{@price}円"
  end

end
#  binding.pry
#注文を受け付けるクラス
class Order
  attr_reader :order_plan, :person_num
  def initialize(travel_plans,plan_number,person_num)

    @order_plan  = travel_plans[plan_number -1]
    @person_num = person_num
  end
end

# 各種料金の計算と表示クラス
class Calculate
  attr_reader :calcu_fee ,:basic_fee
  def initialize(plan_fee,person_num)
    @plan_fee = plan_fee
    @person_num = person_num
    # @calcu_fee = plan_fee * person_num
  end
  def caluc_base_fee
    puts "基本料金は下記の通りになります"
    basic_fee = @plan_fee * @person_num
  end
  def caluc_dicount_fee
    puts "ご優待で一割引の価格！"
    disocout_fee = @plan_fee * @person_num * 0.9
  end
end


#商品の企画と表示
plan_1 = Plan.new(place: "沖縄", price: 10000)
plan_2 = Plan.new(place: "北海道", price: 20000)
plan_3 = Plan.new(place: "九州", price: 15000)
travel_plans = [plan_1, plan_2, plan_3]

travel_plans.each.with_index(1) do |plan,i|   
  puts "#{i}:#{plan.info_plan(:place,:price)}"
end

#受注開始
puts "注文する番号を入力して下さい！"
plan_number = gets.to_i
puts "参加人数を入力して下さい"
person_num = gets.to_i

order_1 = Order.new(travel_plans,plan_number,person_num)

puts "#{order_1.order_plan.place} 旅行を受注しました！"
puts "一人当たりの料金は#{order_1.order_plan.price} 円になります"
puts "参加人数は#{person_num}ですね"
plan_fee = order_1.order_plan.price

#各種料金の計算と表示
caluc_1 = Calculate.new(plan_fee,person_num)
puts caluc_1.caluc_base_fee
puts caluc_1.caluc_dicount_fee
# binding.pry
