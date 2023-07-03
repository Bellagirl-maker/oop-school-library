require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class Library
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'List all books'
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    puts 'List all people'
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    age = student_age
    name = student_name
    parent_permission = parent_permission_input

    student = build_student(age, name, parent_permission)
    add_person(student)

    puts 'Person created successfully!'
  end

  def student_age
    print 'Student age: '
    gets.chomp
  end

  def student_name
    print 'Student name: '
    gets.chomp
  end

  def parent_permission_input
    loop do
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.upcase
      case permission
      when 'Y'
        return true
      when 'N'
        return false
      else
        puts 'Invalid input! Please enter Y or N.'
      end
    end
  end

  def build_student(age, name, parent_permission)
    Student.new(nil, age, name, parent_permission: parent_permission)
  end

  def add_person(person)
    @people << person
  end

  def create_teacher
    age = teacher_age
    name = teacher_name
    specialization = teacher_specialization

    teacher = build_teacher(age, name, specialization)
    add_person(teacher)

    puts 'Teacher created successfully!'
  end

  def teacher_age
    print 'Teacher age: '
    gets.chomp
  end

  def teacher_name
    print 'Teacher name: '
    gets.chomp
  end

  def teacher_specialization
    print 'Specialization: '
    gets.chomp
  end

  def build_teacher(age, name, specialization)
    Teacher.new(specialization, age, name, parent_permission: true)
  end

  def create_rental
    return if @books.empty? || @people.empty?

    book_index = select_book
    person_index = select_person

    date = rental_date

    rental = build_rental(date, person_index, book_index)
    @rentals << rental

    puts 'Rental created successfully'
  end

  def select_book
    puts 'Select a book from the following list by number:'
    display_books

    gets.chomp.to_i
  end

  def display_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def select_person
    puts 'Select a person from the following list by number (not ID):'
    display_people

    gets.chomp.to_i
  end

  def display_people
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
    end
  end

  def rental_date
    print 'Date: '
    gets.chomp
  end

  def build_rental(date, person_index, book_index)
    Rental.new(date, @people[person_index], @books[book_index])
  end

  def list_rentals
    person_id
    rentals = find_rentals_for_person(person_id)

    if rentals.empty?
      puts 'No rentals found for the specified person ID.'
    else
      display_rentals(rentals)
    end
  end

  def person_id
    print 'Person ID: '
    gets.chomp.to_i
  end

  def find_rentals_for_person(person_id)
    @rentals.select { |rental| rental.person.id == person_id }
  end

  def display_rentals(rentals)
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
