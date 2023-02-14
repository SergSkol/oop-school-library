require './person'

class Teacher < Person
  def initialize(age, name, specialization, id = nil)
    super(age, name, id)
    @specialization = specialization
  end

  attr_reader :id

  def can_use_services?
    true
  end

  def receive_item
    { class: 'teacher', id: @id, name: @name, age: @age, specialization: @specialization }
  end
end
