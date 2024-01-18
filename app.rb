require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books'
    else
      @books.each do |e|
        puts "Title: #{e.title}, Author: #{e.author}"
      end
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
      classroom = nil
      student = Student.new(classroom, age, name, parent_permission, nil)
      @people.push(student)
    when '2'
      print 'Specialization:'
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization, nil)
      @people.push(teacher)
    end
    puts 'Person created successfully'
  end

  def create_book
    print 'Title:'
    title = gets.chomp

    print 'Author:'
    author = gets.chomp

    book = Book.new(title, author, nil)
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

  # ------------------------ #
  # Save and Load operations #
  # ------------------------ #
  def save_data
    save_books
    save_people
    save_rentals
  end

  def load_data
    @books = load_books || []
    @people = load_people || []
    @rentals = load_rentals || []
  end

  def save_books
    arr = []
    @books.each do |e|
      arr.push(e.receive_item)
    end
    File.write('./data/books.json', JSON.generate(arr))
  end

  def load_books
    return unless File.exist?('./data/books.json')

    JSON.parse(File.read('./data/books.json')).map do |e|
      id = e['id']
      title = e['title']
      author = e['author']
      Book.new(title, author, id)
    end
  end

  def save_people
    arr = []
    @people.each do |e|
      arr.push(e.receive_item)
    end
    File.write('./data/people.json', JSON.generate(arr))
  end

  def load_people
    return unless File.exist?('./data/people.json')

    JSON.parse(File.read('./data/people.json')).map do |e|
      id = e['id'].to_i
      people_class = e['class']
      name = e['name']
      age = e['age']
      if people_class == 'student'
        classroom = e['classroom']
        parent_permission = e['parent_permission']
        Student.new(classroom, age, name, parent_permission, id)
      else
        specialization = e['specialization']
        Teacher.new(age, name, specialization, id)
      end
    end
  end

  def save_rentals
    arr = []
    @rentals.each do |e|
      arr.push(e.receive_item)
    end
    File.write('./data/rentals.json', JSON.generate(arr))
  end

  def load_rentals
    return unless File.exist?('./data/rentals.json')

    JSON.parse(File.read('./data/rentals.json')).map do |e|
      date = e['date']
      person_id = e['person_id'].to_i
      book_id = e['book_id'].to_i

      person = @people.find { |item| item.id == person_id }
      book = @books.find { |item| item.id == book_id }

      Rental.new(date, person, book)
    end
  end
end
