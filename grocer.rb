def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  
      index = 0
    while index < collection.length
        if name == collection[index][:item]
            return collection[index]
        end
        index += 1
    end
    return nil
  
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
    result = cart.uniq
    result_index = 0
    while result_index < result.length do
        cart_index = 0
        while cart_index < cart.length
            if result[result_index][:item] == cart[cart_index][:item]
                if result[result_index][:count] == nil
                    result[result_index][:count] = 1
                else
                    result[result_index][:count] += 1
                end
            end
            cart_index += 1
        end
        result_index += 1
    end
    result
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
    cart_index = 0
    while cart_index < cart.length do
        coupons_index = 0
        while coupons_index < coupons.length
            if cart[cart_index][:item] == coupons[coupons_index][:item]
                cart[cart_index][:count] -= coupons[coupons_index][:num]
                discount_item = cart[cart_index].dup
                discount_item[:count] = coupons[coupons_index][:num]
                discount_item[:item]  += " W/COUPON"
                discount_item[:price] = coupons[coupons_index][:cost] / coupons[coupons_index][:num]
                cart.push(discount_item)
            end
            coupons_index += 1
        end
        cart_index += 1
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
            cart[index][:price] *= 0.8
            cart[index][:price].round(2)
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




