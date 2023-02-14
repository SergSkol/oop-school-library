require_relative 'app'

class Main < App
  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def run
    loop do
      menu
      option = gets.chomp.to_i
      case option
      when 1
        list_all_books
      when 2
        list_all_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals
      else break
      end
    end
  end

  def main
    load_data
    puts 'Welcome to School Library App!'
    run
    puts 'Thank you for using this app!'
    save_data
  end
end

main = Main.new
main.main
