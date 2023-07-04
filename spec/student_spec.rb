require_relative '../student'

# age, classroom, name = 'Unknown', parent_permission = 'true'
RSpec.describe Student do
  before :each do
    @new_student = Student.new(28, '1S', 'John Doe', 'true')
  end

  describe '#new' do
    it 'takes four parameters and returns a student object' do
      expect(@new_student).to be_an_instance_of(Student)
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@new_student.name).to eq('John Doe')
    end

    it 'can set the name correctly' do
      @new_student.name = 'Jan'
      expect(@new_student.name).to eq('Jan')
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(@new_student.age).to eq(28)
    end

    it 'can set the age correctly' do
      @new_student.age = 26
      expect(@new_student.age).to eq(26)
    end
  end

  describe '#classroom' do
    it 'returns the correct classroom' do
      expect(@new_student.classroom).to eq('1S')
    end
  end

  describe '#parent_permission' do
    it 'returns the correct parent_permission' do
      expect(@new_student.parent_permission).to eq('true')
    end
  end
end
