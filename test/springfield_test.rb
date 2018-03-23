require 'test/unit'

class Springfield
  def title
    'springfield'
  end
end

class TestSpringfield < Test::Unit::TestCase
  def setup
    @springfield = Springfield.new
  end

  def test_title
    assert_equal "springfield", @springfield.title
  end

  def test_that_will_be_skipped
    skip "test this later"
  end
end
