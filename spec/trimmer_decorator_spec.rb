require_relative '../trimmer_decorator'
describe TrimmerDecorator do
  let(:trimmer_decorator_obj) { double('testing trimming', correct_name: 'ndikumanaisaie') }
  context 'Testing #correct_name' do
    it 'should return the correct name' do
      name = if trimmer_decorator_obj.correct_name.length > 10
               trimmer_decorator_obj
                 .correct_name[0..9]
             else
               trimmer_decorator_obj.correct_name
             end
      expect(name).to eq('ndikumanai')
    end
  end
end
