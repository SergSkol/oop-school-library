require_relative 'spec_helper'

describe Rental do
  context 'Test Rental Class' do
    it 'takes three parameters and returns a Rental object' do
      @student = Student.new nil, 25, 'Sergiy', true, 2
      @book = Book.new 'Title', 'Author', 1
      @rental = Rental.new '2023-02-02', @student, @book
      expect(@rental).to be_an_instance_of Rental
    end
  end
end
