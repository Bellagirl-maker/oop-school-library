require_relative 'nameable'

# Represents a person with attributes such as name, age, and permission.
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental
    book.rentals << rental
  end

  private

  def of_age?
    age >= 18
  end
end
