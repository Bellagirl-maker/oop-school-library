require_relative '../nameable'

RSpec.describe Nameable.new do
  describe '#new' do
    it 'takes no parameters and returns Nameable object' do
      expect(subject).to be_an_instance_of(Nameable)
    end
  end

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { subject.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
