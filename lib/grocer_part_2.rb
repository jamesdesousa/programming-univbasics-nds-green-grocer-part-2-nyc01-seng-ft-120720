require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  arr = []
  cart.each do |num|
    coupons.each do |n|
      if num[:item] == n[:item] 
         num[:count] = num[:count] - n[:num]
         if num[:count]!=0 
         arr << num
       end 
         arr << {:item => "#{num[:item]} W/COUPON", :price => n[:cost]/n[:num], :clearance => num[:clearance], :count => n[:num]}
         end 
    end 
    arr << num  
  end
  arr 
end 

def apply_clearance(cart)
  arr = []
  cart.each do |num|
    if num[:clearance] == true 
      num[:count].times do
        num[:price] = num[:price] - (num[:price] * (0.2)) 
        num[:price] = num[:price].round(2)
      end 
    end 
    arr << num 
end
  arr 
end 

def checkout(cart, coupons)
  total = 0.0 
  conscart = consolidate_cart(cart)
  
  coupcart = apply_coupons(conscart, coupons)
  newcart = apply_clearance(coupcart)
  
   
  newcart.each do |num|
    total = total + num[:price] * num[:count]
    
  end 
  if total > 100
    total = total - (total * (0.1))
  end 
  binding.pry 
  total.round(2) 
end
