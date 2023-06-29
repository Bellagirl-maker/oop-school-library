# frozen_string_literal: true

require 'date'
# Represents a rental with attributes such as date, book, and person.
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end
end
