require './person'

class Student < Person
  # belongs_to :classroom

  def initialize(classroom, age, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    # classroom.students << self
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  attr_reader :classroom

  def play_hooky?
    '¯(ツ)/¯'
  end

  def set_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
