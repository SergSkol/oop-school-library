require 'json'

class Library
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def save_data
    save_books
    save_people
    save_rentals
  end

  def load_data
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  private

  def save_books
    File.write('books.json', JSON.dump(@books))
  end

  def load_books
    JSON.load(File.read('books.json')) if File.exist?('books.json')
  end

  def save_people
    File.write('people.json', JSON.dump(@people))
  end

  def load_people
    JSON.load(File.read('people.json')) if File.exist?('people.json')
  end

  def save_rentals
    File.write('rentals.json', JSON.dump(@rentals))
  end

  def load_rentals
    JSON.load(File.read('rentals.json')) if File.exist?('rentals.json')
  end
end

library = Library.new(books, people, rentals)

at_exit { library.save_data }

library.load_data
