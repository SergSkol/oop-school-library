class Book
  # has_many: rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(rental)
    # @rentals << rental
    @rentals.push(rental) unless @rentals.include?(rental)
    rental.book = self
  end
end
