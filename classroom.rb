# Represents a classroom with attributes such as label and students
class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    students << student
    student.classroom = self
  end
end

# Represents a student with attributes name and classroom.
class Student
  attr_accessor :name, :classroom

  def initialize(name)
    @name = name
    @classroom = nil
  end
end

# Represents a book with attributes such as title, author, and rentals.
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
end

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

# Represents a person with attributes such as name and rentals.
class Person
  attr_accessor :name, :rentals

  def initialize(name)
    @name = name
    @rentals = []
  end
end
