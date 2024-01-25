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
class Store < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }

  validate :must_carry_apparel

  has_many :employees

  private

  def must_carry_apparel
    errors.add(:base, 'Must carry at least one of men\'s or women\'s apparel') unless mens_apparel || womens_apparel
  end
end

class Employee < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }

  belongs_to :store
end

validate :must_carry_apparel

def must_carry_apparel
  errors.add(:base, 'Must carry at least one of men\'s or women\'s apparel') unless mens_apparel || womens_apparel
end

store_name = gets.chomp

new_store = Store.new(name: store_name)