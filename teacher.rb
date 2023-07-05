require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission = 'true')
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def as_json()
    {
      type: Teacher,
      name: @name,
      id: @id,
      age: @age,
      specialization: @specialization
    }
  end
end
