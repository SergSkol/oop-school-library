class Rental
  # belongs_to: book, person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    # person.rentals << self
    person.rentals.push(self) unless person.rentals.include?(self)

    # book.rentals << self
    book.rentals.push(self) unless book.rentals.include?(self)
  end

  attr_accessor :date, :person, :book
end
