# frozen_string_literal: true

# Testing the classes
require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

classroom = Classroom.new('Math Class')
student1 = Student.new(14, classroom: classroom, parent_permission: true, name: 'John')
student2 = Student.new(15, classroom: classroom, parent_permission: true, name: 'Alice')
classroom.add_student(student1)
classroom.add_student(student2)

book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
person = Person.new('John Doe')

rental = Rental.new(Date.today, book, person)

puts rental.date # Output: 2023-06-28
puts rental.book.title # Output: The Great Gatsby
puts rental.person.name # Output: John Doe

puts book.rentals.first.date # Output: 2023-06-28
puts person.rentals.first.date # Output: 2023-06-28

puts student1.classroom.label # Output: Math Class
puts student2.classroom.label # Output: Math Class
