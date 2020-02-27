=begin  class Triangle 
  attr_accessor :s1, :s2, :s3, :kind 
  
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end 
  
  def kind
    if (s1 * s2 * s3) == 0 || (s1 + s2) <= s3 || (s2 + s3) <= s1 || (s3 + s1) <= s2
      begin
       raise TriangleError
        puts error.message
      end 
      
    elsif s1 == s2 && s1 == s3
     self.kind = :equilateral
     
    elsif s1 == s2 || s1 == s3 || s2 == s3
     self.kind = :isosceles
     
    else 
     self.kind = :scalene
    end 
  end 
end 

class TriangleError < StandardError
  def message
    puts "not a triangle"
  end 
end 
=end 



class Triangle 

  attr_accessor :kind, :a, :b, :c

  def initialize(a, b, c) 
    raise TriangleError if invalid_triangle?(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def invalid_triangle?(a,b,c)
    zero_or_less?(a,b,c) || sides_are_off?(a,b,c)
  end

  def zero_or_less?(a,b,c)
    [a,b,c].any? {|x| x<= 0}
  end

  def sides_are_off?(a,b,c)
    (a + b <= c) || (b + c <= a) || (a + c <= b)
  end

  def kind
    return :equilateral if self.a == self.b && self.b == self.c
    return :isosceles if self.a == self.b || self.a == self.c || self.b == self.c
    :scalene
  end
class TriangleError < Exception 
end
end
