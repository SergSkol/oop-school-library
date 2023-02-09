require_relative 'person'

class Student < Person
  # belongs_to :classroom

  def initialize(classroom, age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.students << self
  end

  attr_reader :classroom

  def play_hooky?
    '¯(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
