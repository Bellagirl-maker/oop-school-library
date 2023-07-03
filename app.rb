require_relative 'library'
require_relative 'create_a_book'

class App
  def initialize
    @library = Library.new
    @create_a_book = CreateABook.new(@library)
  end

  def options
    puts "\n\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List rentals for a person'
    puts '7 - Quit'

    gets.chomp.to_i
  end

  def list_books
    @library.list_books
  end

  def list_people
    @library.list_people
  end

  def create_person
    @library.create_person
  end

  def create_book
    @create_a_book.create_book
  end

  def create_rental
    @library.create_rental
  end

  def list_rentals_for_person
    @library.list_rentals
  end

  def quit
    puts 'Thank you for using the Library App. Goodbye!'
    exit
  end

  def main
    puts "\nWelcome to School Library App!\n"

    app = App.new
    choices = {
      1 => :list_books,
      2 => :list_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals_for_person,
      7 => :quit
    }

    loop do
      option = app.options
      app.send(choices[option])
    end
  end
end
