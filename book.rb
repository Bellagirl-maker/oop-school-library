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
