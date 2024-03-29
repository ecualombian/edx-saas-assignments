require 'dessert'
require 'debugger'
 
describe Dessert do
  describe 'cake' do
    subject { Dessert.new('cake', 400) }
    its(:calories) { should == 400 }
    its(:name)     { should == 'cake' }
    it { should be_delicious }
    it { should_not be_healthy }
  end
  describe 'apple' do
    subject { Dessert.new('apple', 75) }
    it { should be_delicious }
    it { should be_healthy }
  end
  describe 'can set' do
    before(:each) { @dessert = Dessert.new('xxx', 0) }
    it 'calories' do
      @dessert.calories = 80
      @dessert.calories.should == 80
    end
    it 'name' do
      @dessert.name = 'ice cream'
      @dessert.name.should == 'ice cream'
    end
  end
end