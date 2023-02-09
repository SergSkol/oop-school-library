require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    @books.each do |e|
      puts "Title: #{e.title}, Author: #{e.author}"
    end
  end

  def list_all_people
    @people.each do |e|
      puts "[#{e.class.name}] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    number = gets.chomp

    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    case number
    when '1'
      print 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp.upcase == 'Y'
      classroom = Classroom.new('Unknown')
      @people << Student.new(classroom, age, parent_permission, name)
    when '2'
      print 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      @people.push(teacher)
    end
    puts 'Person created successfully'
  end

  def create_book
    print 'Title:'
    title = gets.chomp

    print 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |e, index|
      puts "#{index}) Title: #{e.title}, Author: #{e.author}"
    end
    book_number = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |e, index|
      puts "#{index}) Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
    end
    person_number = gets.chomp.to_i

    print 'Date:'
    date = gets.chomp

    rental = Rental.new(date, @people[person_number], @books[book_number])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person:'
    id = gets.chomp.to_i

    puts 'Rentals:'

    @rentals.each do |e|
      puts "Date: #{e.date}, Book: #{e.book.title} by #{e.book.author}" if e.person.id == id
    end
  end

  def menu
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given persion id'
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
    puts 'Thank you for using this app!'
  end
end
