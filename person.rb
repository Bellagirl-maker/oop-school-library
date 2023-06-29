require_relative 'nameable'

# Represents a person with attributes such as name, age, and permission.
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :rentals

  @all = []

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    self.class.all << self
  end

  def self.find_by_id(id)
    all.find { |person| person.id == id }
  end

  private_class_method :find_by_id

  class << self
    attr_reader :all
  end
end


