require_relative 'person'

# Represents a sub-class of Person.

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end
end

# class Teacher < Person
#   def initialize(age, specialization, name = 'Unknown')
#     super(age, name: name)
#     @specialization = specialization
#   end

#   def can_use_services?
#     true
#   end
# end
