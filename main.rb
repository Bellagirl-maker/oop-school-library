require_relative 'menu'

def main
  puts "\nWelcome to the Library App!\n"

  menu = Menu.new
  menu.display_list_of_options
end

main
