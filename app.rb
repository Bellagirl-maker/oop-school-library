# frozen_string_literal: true

require_relative 'classroom'
require_relative 'person'
require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

# Helper method to display a menu of options
def display_menu
  puts 'Please choose an option by entering a number:'
  puts '1 - list all books'
  puts '2 - list all people'
  puts '3 - create a person'
  puts '4 - create a book'
  puts '5 - create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

# Method to handle the chosen option
def select_option(option)
  case option
  when 1
    list_all_books
  when 2
    list_all_people
  when 3
    create_person
  when 4
    create_teacher
  when 5
    create_rental
  when 6
    list_rentals_for_person
  when 7
    exit_program
  else
    puts 'Invalid option. Please try again.'
  end
end

# Define the books variable and populate it with book objects

# Method to list all books
def list_all_books
  puts 'Listing all books:'
  books.each do |book|
    puts "Title: #{book.title}, Author: #{book.author}"
  end
end

# Method to list all books
# def list_all_books
#   puts 'Listing all books:'
#   Book.all.each do |book|
#     puts "Title: #{book.title}, Author: #{book.author}"
#   end
# end

# Method to list all people
def list_all_people
  puts 'Listing all people:'
  Person.all.each do |_person|
    puts "Name: #{person.name}, Age: #{person.Age}"
  end
end

# Method to create a person
def create_person
  puts 'Enter person name:'
  name = gets.chomp
  puts 'Enter person age:'
  age = gets.chomp.to_i

  person = Person.new(age, name: name)
  puts 'Person created successfully!'
  puts "Name: #{person.name}, Age: #{person.age}"
end

# Method to create a teacher
def create_teacher(name, age)
  teacher = Teacher.new(age, name)
  puts 'Teacher created successfully!'
  puts "Name: #{teacher.name}, Age: #{teacher.age}"
end

# Method to create a student
def create_student(name, age)
  classroom = select_classroom
  return unless classroom

  student = Student.new(age, classroom: classroom, name: name)
  puts 'Student created successfully!'
  puts "Name: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom.label}"
end

# Method to select a classroom for a student
def select_classroom
  puts 'Please select a classroom for the student:'
  Classroom.all.each_with_index do |classroom, index|
    puts "#{index + 1}. #{classroom.label}"
  end

  choice = gets.chomp.to_i
  Classroom.all[choice - 1] if choice.between?(1, Classroom.all.length)
end

# Method to create a book
def create_book
  puts 'Please enter the book details:'
  puts 'Title:'
  title = gets.chomp
  puts 'Author:'
  author = gets.chomp

  book = Book.new(title, author)
  puts 'Book created successfully!'
  puts "Title: #{book.title}, Author: #{book.author}"
end

# Method to create a rental
def create_rental
  person = find_person_by_id
  return unless person

  book = find_book_by_title
  return unless book

  rental_date = get_rental_date

  person.add_rental(book, rental_date)
  puts 'Rental created successfully!'
end

# Method to list rentals for a given person id
def list_rentals_for_person
  person = find_person_by_id
  return unless person

  puts "Rentals for Person ID #{person.id}:"
  person.rentals.each do |rental|
    puts "Book: #{rental.book.title}, Date: #{rental.date}"
  end
end

def exit_program
  puts 'Exiting the program. Goodbye!'
  exit(0)
end
