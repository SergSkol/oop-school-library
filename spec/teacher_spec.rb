require_relative 'spec_helper'

describe Teacher do
  context 'Test Teacher Class' do
    it 'takes three parameters and returns a Teacher object' do
      @teacher = Teacher.new 25, 'Sergiy', 'biology', 2
      expect(@teacher).to be_an_instance_of Teacher
    end
  end
end
