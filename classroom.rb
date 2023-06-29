# frozen_string_literal: true

# Represents a classroom with attributes such as label and students
class Classroom
  attr_accessor :label
  attr_reader :students

  @all = []

  def initialize(label)
    @label = label
    @students = []
    self.class.all << self
  end

  def add_student(student)
    students << student
    student.classroom = self
  end

  class << self
    attr_reader :all
  end
end
