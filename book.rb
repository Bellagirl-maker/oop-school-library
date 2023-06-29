# frozen_string_literal: true

# Represents a book with attributes such as title, author, and rentals.
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  @all_books = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.all << self
  end

  def self.all
    @all_books
  end
end


# class Book
#   attr_accessor :title, :author
#   attr_reader :rentals

#   @@all_books = []

#   def initialize(title, author)
#     @title = title
#     @author = author
#     @rentals = []
#     @@all_books << self
#   end

#   def self.all
#     @@all_books
#   end

#   def self.find_by_title(title)
#     all.find { |book| book.title == title }
#   end

#   def add_rental(person, date)
#     rental = Rental.new(date, self, person)
#     @rentals << rental
#     person.rentals << rental
#   end
# end
