class Triangle
  def initialize(a, b, c)
    @a, @b, @c = [a, b, c].sort!
  end

  def to_s
    return '正三角形ですね！' if equilateral_triangle?
    return '二等辺三角形ですね！' if isosceles_triangle?
    return '不等辺三角形ですね！' if triangle?
    '三角形じゃないです＞＜'
  end

  def equilateral_triangle?
    # 三角形の条件を満たし、かつ全ての辺が等しい
    triangle? && [@a, @b, @c].combination(2).map{|a, b| a == b}.all?
  end

  def isosceles_triangle?
    # 三角形の条件を満たし、かついずれかの2辺が等しい
    triangle? && [@a, @b, @c].combination(2).map{|a, b| a == b}.any?
  end

  def triangle?
    # 3辺が全て 0 よりも大きく
    # 短い2辺の和が残りの辺よりも長ければ三角形
    # @a <= @b <= @c であるため、@a > 0 であれば他の2辺も0より大きい
    @a > 0 && @a + @b > @c
  end
end

if $0 == __FILE__
  if ARGV.size == 3
    puts Triangle.new(*ARGV.map(&:to_f)).to_s
  else
    puts "#{$0} 数字, 数字, 数字 の形で実行してください。"
  end
end
