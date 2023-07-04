require_relative '../teacher'

RSpec.describe Teacher do
  before :each do
    @new_teacher = Teacher.new(28, 'Plantae', 'Jane Doe')
  end

  describe '#new' do
    it 'takes four parameters and returns a Teacher object' do
      expect(@new_teacher).to be_an_instance_of(Teacher)
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@new_teacher.name).to eq('Jane Doe')
    end

    it 'can set the name correctly' do
      @new_teacher.name = 'John'
      expect(@new_teacher.name).to eq('John')
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(@new_teacher.age).to eq(28)
    end

    it 'can set the age correctly' do
      @new_teacher.age = 40
      expect(@new_teacher.age).to eq(40)
    end
  end

  describe '#specialization' do
    it 'returns the correct specialization' do
      expect(@new_teacher.specialization).to eq('Plantae')
    end
  end

  describe '#parent_permission' do
    it 'return \'true\' as the default value for parent permission' do
      expect(@new_teacher.parent_permission).to eq('true')
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(@new_teacher.can_use_services?).to eq(true)
    end
  end
end
