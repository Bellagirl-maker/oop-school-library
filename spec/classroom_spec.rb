require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:new_classroom) { Classroom.new '1N' }
  let(:student_mock) { double('John Doe') }

  describe '#new' do
    it 'takes one parameter and returns Classroom object' do
      expect(new_classroom).to be_an_instance_of(Classroom)
    end

    it 'initializes students as empty array by default' do
      expect(new_classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a new student' do
      new_classroom.students.push(student_mock)

      expect(new_classroom.students.size).to eq(1)
    end
  end
end
