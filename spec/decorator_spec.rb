require_relative 'spec_helper'

describe Decorator do
  context 'Test Decorator Class' do
    it 'takes nameable class parent and returns a Decorator object' do
      @nameable = Nameable.new
      @decorator = Decorator.new(@nameable)
      expect(@decorator).to be_an_instance_of Decorator
    end
  end
end
