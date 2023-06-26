require_relative 'person'

# Represents a sub-class of Person.
class Teacher < Person
  def initialize(age, specialization, name = 'Unknown')
    super(age, true, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
