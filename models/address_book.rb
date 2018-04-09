require_relative 'entry'
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = [ ]
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(@entries.length, Entry.new(name, phone_number, email))
  end

  def import_from_csv(file_name)
    #starts by reading the file using File.reading
    csv_text = File.read(file_name)
    #parses the CSV and returns an object with tables
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    #iterates over each table row, turns it into a hash and then adds it as an entry
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

  def remove_entry(name, phone_number, email)
    @entries.each do |entry|
      if name == entry.name && phone_number == entry.phone_number && email == entry.email
        @entries.delete(entry)
        break
      end
    end
  end

  def binary_search(name)
    #this saves the leftmost/first item in the array in a variable named lower
    #and the rightmost/last item in the array as upper
    lower = 0
    upper = entries.length - 1

    while lower <= upper
      #here were finding the middle index, ruby rounds down decimals(ex: 5 - 0, mid = 2)
      mid = (lower + upper) / 2
      #storing the middle index value to mid_name
      mid_name = entries[mid].name

      #comparing the passed in entry to the mid_name
      if name == mid_name
        return entries[mid]
      #if name is alphabetically before mid_name then we set upper to mid - 1
      #because that means the name must be in the lower half of the array
      elsif name < mid_name
        upper = mid - 1
      #if name is after, the we set lower to mid + 1, since name is in the upper
      #half of the array
      elsif name > mid_name
        lower = mid + 1
      end
    end

    return nil

    end
  end
