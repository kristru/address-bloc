#this connects AddressBook class to this file
require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

#this displays the options to the command line
  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

#retrieves the selection from the command line
#gets reads and stores the next line from the standard input
    selection = gets.to_i

#case statement operator compares the target (the expression after the keyword)
#with the when options and runs those commands
    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
#this terminates the program. 0 means it's closing without error
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
#call this method to display a submenu for each entry
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
#chomp removes and trailing whitespace from the string gets returns
#this is necessary to ensure it passes === test
    selection = gets.chomp

    case selection
    when "n"
    when "d"
    when "e"
    when "m"
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end

  def create_entry
#clears the screen before loading new prompts
    system "clear"
    puts "New AddressBloc Entry"
#prompts the user for each entry attribute. Print works just like puts
#except it doesn't add a new line (cursor stays in place)
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
#calls the add_entry method with the passed in arguments
    address_book.add_entry(name, phone, email)
    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

end
