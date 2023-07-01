require_relative 'app'

def main
  puts "\nWelcome to School Library App!\n"

  app = App.new
  choices = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals,
    7 => :quit
  }

  loop do
    option = app.options
    app.send(choices[option])
  end
end

main
