# frozen_string_literal: true

require_relative 'nameable'

# Represents a person with attributes such as name, age, and permission.
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :rentals

  @all = []

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    self.class.all << self
  end

  def self.find_by_id(id)
    all.find { |person| person.id == id }
  end

  private_class_method :find_by_id

  class << self
    attr_reader :all
  end
end


# class Person < Nameable
#   attr_accessor :name, :age
#   attr_reader :rentals

#   @@all = []

#   def initialize(age, name: 'Unknown', parent_permission: true)
#     super()
#     @name = name
#     @age = age
#     @parent_permission = parent_permission
#     @rentals = []
#     @@all << self
#   end

#   def correct_name
#     name
#   end

#   def can_use_services?
#     of_age? || @parent_permission
#   end

#   def add_rental(book, date)
#     rental = Rental.new(date, book, self)
#     @rentals << rental
#     book.rentals << rental
#   end

#   def self.all
#     @@all
#   end

#   private

#   def of_age?
#     age >= 18
#   end

#   def self.find_by_id(id)
#     @@all.find { |person| person.id == id }
#   end
# end
