require_relative 'controllers/menu_controller'

#this creates a new MenuController at start
menu = MenuController.new
#this clears the command line
system "Clear"
puts "Welcome to AddressBloc!"

#this calls MenuController method menu to display
menu.main_menu
