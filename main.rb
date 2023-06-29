# frozen_string_literal: true

require_relative 'app'

def main
  loop do
    display_menu
    option = gets.chomp.to_i
    break if option == 7 # Exit option

    select_option(option)
    puts ''
  end

  puts 'Exiting the application. Goodbye!'
end

main



# def main
#   loop do
#     puts 'Please choose an option by entering a number:'
#     puts '1 - List all books'
#     puts '2 - List all people'
#     puts '3 - Create a person'
#     puts '4 - Create a book'
#     puts '5 - Create a rental'
#     puts '6 - List all rentals for a given person id'
#     puts '7 - Exit'

#     option = gets.chomp.to_i

#     case option
#     when 1
#       list_all_books
#     when 2
#       list_all_people
#     when 3
#       create_person
#     when 4
#       create_book
#     when 5
#       create_rental
#     when 6
#       list_rentals_for_person
#     when 7
#       puts 'Exiting the application. Goodbye!'
#       break
#     else
#       puts 'Invalid option. Please try again.'
#     end

#     puts ''
#   end
# end

# main
