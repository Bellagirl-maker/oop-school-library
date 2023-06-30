require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    people.each do |person|
      puts "#{person.name} (#{person.class})"
    end
  end

  def create_person
    puts 'Create a Person'
    puts 'Enter name:'
    name = gets.chomp

    puts 'Enter age:'
    age = gets.chomp.to_i

    puts 'Is the person a student or a teacher? (s/t)'
    person_type = gets.chomp.downcase

    case person_type
    when 's'
      puts "Enter the person's classroom:"
      classroom = gets.chomp

      person = Student.new(age, classroom: classroom, name: name)
      people << person
      puts "Student '#{person.name}' created!"
    when 't'
      puts "Enter the person's specialization:"
      specialization = gets.chomp

      person = Teacher.new(age, specialization, name)
      people << person
      puts "Teacher '#{person.name}' created!"
    else
      puts 'Invalid person type.'
    end
  end

  def create_book
    puts 'Create a Book'
    puts "Enter the book's title:"
    title = gets.chomp

    puts "Enter the book's author:"
    author = gets.chomp

    book = Book.new(title, author)
    books << book
    puts "Book '#{book.title}' created!"
  end

  def create_rental
    puts 'Create a Rental'
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    person = find_person_by_id(person_id)
    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    puts "Enter the book's ID:"
    book_id = gets.chomp.to_i

    book = find_book_by_id(book_id)
    if book.nil?
      puts "Book with ID #{book_id} not found."
      return
    end

    puts 'Enter the rental date (YYYY-MM-DD):'
    rental_date = gets.chomp

    rental = Rental.new(Date.parse(rental_date), book, person)
    rentals << rental
    puts "Rental created for '#{person.name}' - '#{book.title}'"
  end

  def list_rentals_for_person
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i

    person = find_person_by_id(person_id)
    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    rentals_for_person = rentals.select { |rental| rental.person == person }

    puts "Rentals for '#{person.name}':"
    rentals_for_person.each do |rental|
      puts "#{rental.book.title} - #{rental.date}"
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def main
    loop do
      puts 'Welcome to the Library App!'
      puts 'Please select an option:'
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List rentals for a person'
      puts '7. Quit'

      option = gets.chomp.to_i

      case option
      when 1
        list_books
      when 2
        list_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals_for_person
      when 7
        puts 'Thank you for using the Library App. Goodbye!'
        break
      else
        puts 'Invalid option. Please try again.'
      end

      puts "\n"
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
