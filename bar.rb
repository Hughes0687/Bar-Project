require 'time' # you're gonna need it
#require 'pry-debugger'

class Bar
	attr_reader :name
	attr_accessor :menu_items, :happy_discount

	def initialize(name="Stevo's Bar")
		@name = name
		@menu_items = []
    @happy_discount = 0
	end

	def add_menu_item(item,price)
		@item = item
		@price = price
		@menu_items << Menu.new(item,price)
	end

	def happy_hour?
    if Time.now.hour == 15
      return true
    else 
      return false
    end
  end

	def happy_discount(price=0)
		if happy_hour?
      if Time.now.wday == 1 || Time.now.wday == 3
        return @happy_discount
      else
        return (@happy_discount / 2.0)
      end
    else
      return 0
    end
	end

    def happy_discount=(max_discount)
    if max_discount > 1
      @happy_discount = 1
    elsif max_discount < 0
      @happy_discount = 0
    else
      @happy_discount = max_discount
    end
  end

end


class Menu
  attr_reader :name, :price, :discount
  def initialize(name, price, discount = true)
    @name = name
    @price = price
    @discount = discount
  end
end