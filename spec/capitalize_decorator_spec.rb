require_relative '../capitalize_decorator'
describe CapitalizeDecorator do
  let(:capitalize_decorator_obj) { double('testing capitalize', correct_name: 'sam') }
  context 'Testing the capitalize decorator class' do
    it 'Shoud capitalize the first character' do
      name = capitalize_decorator_obj.correct_name.capitalize
      expect(name).to eq 'Sam'
    end
  end
end
