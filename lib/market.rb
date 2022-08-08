class Market

  attr_reader :name, :inventory, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.include?(item)
    end 
  end


  ### not okay

  # def total_inventory
  #   require 'pry'; binding.pry
  #   list_of_inventory = Hash.new(0)

  #   @vendors.each do |vendor|
  #     vendor_w_product = vendors_that_sell(item)
  #     qty = vendor_w_product.sum do |vendor| 
  #       vendor.inventory[item]
  #     list_of_inventory[item] = {quantity: qty, vendors: vendor_w_product}
  #     end
  #     list_of_inventory
  #   end
  # end
    
  ##### okay

  def items_sum #helper for overstocked_items
    sum = Hash.new(0)

    @vendors.each do |vendor|
      vendor.inventory.each do |item, qty|
        sum[item] += qty
      end
    end
    sum
  end

  def overstocked_items
    overstocked = []
    items_sum.map do |product, quantity|
      overstocked << product if quantity > 50 && vendors_that_sell(product).count > 1
    end
    overstocked
  end 
   
  def sorted_item_list
    items = @vendors.flat_map do |vendor|
      vendor.inventory.keys
      end
    item_names = items.map do |item|
      item.name
    end.uniq.sort
  end 
end