require_relative 'spec_helper'

describe Book do
  context 'Test Book Class' do
    it 'takes three parameters and returns a Book object' do
      @book = Book.new 'Title', 'Author', 1
      expect(@book).to be_an_instance_of Book
    end
  end
end
