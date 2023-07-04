require_relative '../book'

RSpec.describe Book do
  # let(:book) {Book.new 'Title', 'Author'}
  before :each do
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'takes two parameters and return a book object' do
      # @book.should be_an_instance_of Book
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql('Title')
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql('Author')
    end
  end
end
