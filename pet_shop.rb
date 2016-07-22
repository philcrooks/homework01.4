
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, delta)
  pet_shop[:admin][:pets_sold] += delta
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  result = []
  for pet in pet_shop[:pets]
    result.push pet[:name] if pet[:breed] == breed
  end
  return result
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == name
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    pet_shop[:pets].delete(pet) if pet[:name] == name
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] >= new_pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet && customer_can_afford_pet(customer, pet)
    # Transfer the funds
    customer[:cash] -= pet[:price]
    add_or_remove_cash(pet_shop, pet[:price])
    # Transfer the pet
    add_pet_to_customer(customer, pet)
    pet_shop[:pets].delete(pet)
    increase_pets_sold(pet_shop, 1)
  end
end
