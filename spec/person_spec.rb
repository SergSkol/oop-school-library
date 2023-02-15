require_relative 'spec_helper'

describe Person do
  context 'Test Person Class' do
    it 'takes three parameters and returns a Person object' do
      @person = Person.new 25, 'Sergiy', 1
      expect(@person).to be_an_instance_of Person
    end
  end
end