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

  def total_inventory
    # require 'pry'; binding.pry

    list_of_inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |k, v|
        vendor_w_product = vendors_that_sell(k)
        qty = vendor_w_product.sum do |vendor| 
              vendor.inventory[k]
        end 
    
        list_of_inventory[k] = {quantity: qty, vendors: vendor_w_product}
        end
  
      end
      list_of_inventory
  end
    
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