require_relative 'spec_helper'

describe Student do
  context 'Test Student Class' do
    it 'takes four parameters and returns a Student object' do
      @student = Student.new nil, 25, 'Sergiy', true, 2
      expect(@student).to be_an_instance_of Student
    end
  end
end
