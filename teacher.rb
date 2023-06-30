require_relative 'person'

# Represents a sub-class of Person.

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end
end
