require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  # has_many: rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Getters & Setters
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end
  private :of_age?

  def can_use_services?
    if @parent_permission || of_age
      true
    else
      false
    end
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
