require_relative 'spec_helper'

describe Classroom do
  context 'Test Classroom Class' do
    it 'takes one parameters and returns a Classroom object' do
      @classroom = Classroom.new 'Business Class'
      expect(@classroom).to be_an_instance_of Classroom
    end
  end
end
