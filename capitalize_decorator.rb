require_relative 'decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable_object.correct_name.capitalize
  end
end
