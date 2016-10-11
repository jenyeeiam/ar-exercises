require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

@store4 = Store.find(4)

@store1.employees.create(first_name: "Khurram", last_name: "Viriani", hourly_rate: 60)
@store2.employees.create(first_name: "Khurram", last_name: "Viriani", hourly_rate: 60)
@store2.employees.create(first_name: "Don", last_name: "Burks", hourly_rate: 60)
@store4.employees.create(first_name: "Khurram", last_name: "Viriani", hourly_rate: 60)
@store4.employees.create(first_name: "Don", last_name: "Burks", hourly_rate: 60)

