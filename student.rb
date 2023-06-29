# frozen_string_literal: true

require_relative 'person'

# Represents a sub-class of Person.
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom:, parent_permission: true, name: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
