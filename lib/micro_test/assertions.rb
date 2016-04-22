class MicroTest
  def assert(test, msg = "Test failed")
    unless test
      print 'F'
      raise RuntimeError, msg
    else
      print '.'
    end
  end

  def assert_equal(one, other)
    assert one == other, "#{one} is not equal to #{other}"
  end
end
