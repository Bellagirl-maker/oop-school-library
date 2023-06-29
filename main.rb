require_relative 'app'
# method as entry point
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



