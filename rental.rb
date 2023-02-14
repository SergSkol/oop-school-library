require_relative 'person'
require_relative 'book'

class Rental
  # belongs_to: book, person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    person.rentals << self unless person
    book.rentals << self unless book
  end

  attr_accessor :date, :person, :book

  def receive_item
    { date: @date, person_id: @person.id, book_id: @book.id }
  end
end
