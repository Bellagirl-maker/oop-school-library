require 'json'
require './app'
require './book'
require './teacher'
require './student'
require './rental'
require './person'

class Storage
  def initialize(app)
    @app = app
  end

  def save_people
    return if @app.people.empty?

    people_json = @app.people.map(&:as_json)
    File.write('people.json', JSON.dump(people_json))
  end

  def load_people
    # handle case when people.json is not available
    return unless File.exist?('people.json')

    people_json = JSON.parse(File.read('people.json'))
    people_json.each do |person|
      if person['type'] == 'Student'
        new_student = Student.new(person['age'], person['classroom'], person['name'], person['parent_permission'])
        @app.people.push(new_student)
      else
        new_teacher = Teacher.new(person['age'], person['specialization'], person['name'])
        @app.people.push(new_teacher)
      end
    end
  end

  def read_data
    load_people
    load_books
    load_rentals
  end

  def write_data
    save_people
    save_books
    save_rentals
  end

  def save_books
    return if @app.books.empty?

    books = @app.books.map(&:as_json)
    File.write('books.json', JSON.dump(books))
  end

  def load_books
    return unless File.exist?('books.json')

    books = JSON.parse(File.read('books.json'))
    books.each do |book|
      new_book = Book.new(book['title'], book['author'])
      @app.books.push(new_book)
    end
  end

  def find_person(person_id)
    @app.people.each { |people| return people if people.id == person_id }
  end

  def find_book(book_title)
    @app.books.each { |book| return book if book.title == book_title }
  end

  def load_rentals
    return unless File.exist?('rentals.json')

    JSON.parse(File.read('rentals.json')).map do |rental|
      date = rental['date']
      person = find_person(rental['person_id'])
      book = find_book(rental['book_title'])
      new_rental = Rental.new(date, book, person[0])
      @app.rentals.push(new_rental)
    end
  end

  def save_rentals
    rentals_json = []
    @app.rentals.each do |rental|
      rentals_json.push({ date: rental.date, person_id: rental.person.id, book_title: rental.book.title })
    end
    open('rentals.json', 'w') { |f| f << JSON.generate(rentals_json) }
  end
end
