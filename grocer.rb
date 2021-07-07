def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
    index = 0
    while index < collection.length
        if collection[index][:item] == name
            return collection[index]
        end
        index += 1
    end
    nil
  
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
    new_cart = []
    counter = 0
    while counter < cart.length do
      new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
      if new_cart_item != nil
        new_cart_item[:count] += 1 
      else 
        new_cart_item = {
          :item => cart[counter][:item],
          :price => cart[counter[:price],
          :clearence => cart[counter][:clearence],
          :count => 1
        }
        new_cart << new_cart_item
      end
      counter +=1
    end
    new_cart 
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
 index = 0
 while index < coupons.length
  cart_item = find_item_by_name_in_collection(coupons[index][:item], cart)
  couponed_item_name = "#{coupons[index][:item]} W/COUPON"
  cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[index][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[index][:num]
        cart_item[:count] -= coupons[index][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[index][:cost] / coupons[index][:num],
          :count => coupons[index][:num],
          :clearance => cart_item[:clearance]
          }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end
    end
    index += 1
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
    # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
    index = 0
    while index < cart.length do
        if cart[index][:clearance] == true
            (cart[index][:price] * 0.8).round(2)
        end
        index += 1
    end
    
    cart
  
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  

  consolidated_cart = consolidate_cart(cart)
  cart_after_coupons =  apply_coupons(consolidated_cart, coupons)
  cart_after_clearance = apply_clearance(cart_after_coupons)
  
    total = 0
    index = 0
    while index < cart_after_clearance.length do
        total += cart_after_clearance[index][:price] * cart_after_coupons[index][:count]
        index += 1
    end

    if total > 100
        total *= 0.9
        total.round(2)
    end

    total


end




