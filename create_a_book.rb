class CreateABook
  def initialize(library)
    @library = library
    @books = @library.books
  end

  def create_book
    title = book_title
    author = book_author

    book = build_book(title, author)
    add_book(book)

    puts 'Book created successfully'
  end

  def book_title
    print 'Book Title: '
    gets.chomp
  end

  def book_author
    print 'Book Author: '
    gets.chomp
  end

  def build_book(title, author)
    Book.new(title, author)
  end

  def add_book(book)
    @books << book
  end
end
