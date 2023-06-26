require_relative 'person'
# Represents a sub-class of Person.
class Student < Person
  def initialize(age, classroom:, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
