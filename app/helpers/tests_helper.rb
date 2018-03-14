module TestsHelper

  def test_level(test)
    case test.level
    when 0
      'basic'
    when 1..4
      'medium'
    when 5..Float::INFINITY
      'advanced'
    end
  end
  
end
