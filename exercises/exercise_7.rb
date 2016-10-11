require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  validates :name,
    presence: true,
    length: {minimum: 3}
  validates :annual_revenue,
    numericality: {
      only_integer: true,
      greater_than: 0
    }
  validate :must_contain_apparel
  def must_contain_apparel
    if !mens_apparel.present? || !womens_apparel.present?
      errors.add(:mens_apparel, "must contain")
      errors.add(:womens_apparel, "must contain")
    end
  end
end

class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate,
    numericality: {
      only_integer: true,
      greater_than: 40,
      less_than: 200
    }
  validates :store_id, presence: true
end

puts "Input store name"

store = gets.chomp

new_store = Store.new name: store

puts new_store.errors.inspect


test = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: "", womens_apparel: true)

puts test.errors.inspect