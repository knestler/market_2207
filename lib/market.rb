class Market

  attr_reader :name, :inventory, :vendors

  def initialize(name)
    @name = name
    @inventory = []
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

  def potential_revenue
    require 'pry'; binding.pry 
    @vendors.each do |vendor|

     end
  end

end
