class SimpleTest
  def self.sum(array)
    array.reduce(&:+)
  end
end

describe 'Simple Test' do
  it 'calculates 2 + 2' do
    SimpleTest.sum([1,2,3]).should == 6
  end
end