def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  i = 0
  match = nil
  while i < collection.length do
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1
  end
end

def consolidate_cart(cart)
  new_cart = []
  i = 0

  while i < cart.length do
    new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart)
    if new_cart_item
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
      new_cart << new_cart_item
    end
    i += 1
  end

  new_cart
end

def apply_coupons(cart, coupons)

  if coupons.length == 0
    return cart
  end

  i = 0
  while i < coupons.length do
    cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
    couponed_item_name = "#{coupons[i][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)

    if cart_item && cart_item[:count] >= coupons[i][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[i][:num]
        cart_item[:count] -= coupons[i][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[i][:cost]/coupons[i][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[i][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[i][:num]
      end
    end
    
    i += 1
  end
  cart
end

def apply_clearance(cart)
  i = 0
  while i < cart.length
    if cart[i][:clearance]
      cart[i][:price] = (cart[i][:price] * 0.8).round(3)
    end

    i += 1
  end

  cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  cart_coupons_applied = apply_coupons(consolidated_cart, coupons)
  cart_clearance_applied = apply_clearance(cart_coupons_applied)

  i = 0
  total = 0
  while i < cart_clearance_applied.length do
    item = cart_clearance_applied[i]
    total += item[:price] * item[:count]
    i += 1
  end

  if total > 100
    total *= 0.9
  end

  total
end
