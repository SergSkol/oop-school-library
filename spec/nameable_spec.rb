require_relative 'spec_helper'

describe Nameable do
  context 'Test Nameable Module' do
    it 'takes a string and returns a Nameable object' do
      @nameable = Nameable.new
      expect(@nameable).to be_an_instance_of Nameable
    end
  end
end
