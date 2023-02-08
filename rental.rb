class Rental
  # belongs_to: book, person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    person.rentals << self
    book.rentals << self
  end

  attr_accessor :date, :person, :book
end
