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

class TriangleError < StandardError
end

class Triangle

  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    sides = [a,b,c]
    ineq = [a+b > c, a+c > b, b+c > a]

    if sides.min <= 0 || ineq.include?(false)
      raise TriangleError
    end

    if a == b && b == c
      :equilateral
    elsif a != b && a != c && b != c
      :scalene
    elsif (a == b && b != c) || (b == c && c != a) || (a == c && c != b)
      :isosceles
    end
  end
  
end