class FirstTest < MicroTest
  def setup
    @some = false
  end

  def turth_test
    assert @some, "#{@some} is not true"
  end

  def fail_test
    assert nil
  end
end
