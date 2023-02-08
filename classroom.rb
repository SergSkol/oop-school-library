class Classroom
  # has_many: students

  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label, :students

  def add_student(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end
end
