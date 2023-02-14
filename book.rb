require_relative 'rental'

class Book
  # has_many: rentals

  def initialize(title, author, id = nil)
    @id = if id.nil?
            Random.rand(1..1000)
          else
            id
          end
    @title = title
    @author = author
    @rentals = []
  end

  attr_reader :id
  attr_accessor :title, :author, :rentals

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def receive_item
    { id: @id, title: @title, author: @author }
  end
end
