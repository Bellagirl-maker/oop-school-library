class Person
  attr_accessor :name, :age
  attr_reader :rentals

  @all = []

  class << self
    attr_reader :all
  end

  def initialize(age, name: 'Unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []

    self.class.all << self
  end
end
