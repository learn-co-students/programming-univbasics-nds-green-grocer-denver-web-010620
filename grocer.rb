require 'pp'
require 'pry'


def find_item_by_name_in_collection(name, collection)
  i = 0
<<<<<<< HEAD
    while i < collection.length do 
      if collection[i][:item] == name 
         return collection[i]
      
     end
    i += 1
   end
 nil
end

def consolidate_cart(cart)
 new_cart = []  
  i = 0
  
    while i < cart.length
      new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_cart) 
          if new_cart_item != nil
            new_cart_item[:count] += 1
          else
            new_cart_item = {
              :item => cart[i][:item],
              :price => cart[i][:price],
              :clearance => cart[i][:clearance],
              :count => 1
            }
            new_cart << new_cart_item
     i += 1
    end
   nil
  end
 new_cart
end
=======
   
     while i < collection.length do 
      if collection[i][:item] == name 
         return collection[i]
         i += 1
    end 
   nil
 end


def consolidate_cart(cart)

 end




>>>>>>> 2286bc73d623f07ae7aaee62dc4ce8cfa0024520



def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def apply_clearance(cart)
  new_array ={}
  
  
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
end
