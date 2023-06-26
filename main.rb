require_relative 'person'
require_relative 'student'
require_relative 'teacher'

person = Person.new(20)
puts person.can_use_services?

student = Student.new(15, false, 'Curtis Brown', 'class c')
puts student.name
puts student.age
puts student.can_use_services?
puts student.play_hooky

teacher = Teacher.new(35, 'Computing', 'Isabella Otoo')
puts teacher.name
puts teacher.age
puts teacher.can_use_services?
