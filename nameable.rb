# Represents a class Nameable with correct_name method
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} must implement the correct_name method"
  end
end

# Represents a Decorator as a sub-class of Nameable
class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

# Represents a class CapitalizeDecorator as a sub-class of Decorator
class CapitalizeDecorator < Decorator
  def correct_name
    super().capitalize
  end
end

# Represents a class TrimmerDecorator as a sub-class of Decorator
class TrimmerDecorator < Decorator
  def correct_name
    super()[0...10]
  end
end
