require_relative 'person'

class Student < Person
  # belongs_to :classroom

  def initialize(classroom, age, name, parent_permission, id = nil)
    super(age, name, id)
    @parent_permission = parent_permission
    @classroom = classroom
    return unless classroom

    classroom.students << self
  end

  attr_reader :classroom, :id

  def play_hooky?
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def receive_item
    { class: 'student', id: @id, name: @name, age: @age, parent_permission: @parent_permission, classroom: @classroom }
  end
end
