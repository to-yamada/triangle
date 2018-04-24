require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  describe '#triangle?' do
    it '短い2辺の和が残りの辺よりも長ければ三角形' do
      expect(Triangle.new(1, 1.1, 2)).to be_triangle
    end

    it '短い2辺の和が残りの辺と同じ長さであれば三角形でない' do
      expect(Triangle.new(1, 1, 2)).not_to be_triangle
    end

    it '0が含まれる場合三角形ではない' do
      expect(Triangle.new(0, 1, 1)).not_to be_triangle
    end

    it '負値が含まれる場合も三角形ではない' do
      expect(Triangle.new(-1, 1, 0)).not_to be_triangle
    end
  end

  describe '#isosceles_triangle?' do
    it 'いずれかの2辺が等しければ二等辺三角形' do
      expect(Triangle.new(1, 2, 2)).to be_isosceles_triangle
    end

    it '正三角形であれば二等辺三角形でもある' do
      expect(Triangle.new(2, 2, 2)).to be_isosceles_triangle
    end

    it 'いずれかの2辺は等しいが、三角形の条件を満たさない場合は二等辺三角形ではない' do
      expect(Triangle.new(1, 1, 2)).not_to be_isosceles_triangle
    end
  end

  describe '#equilateral_triangle?' do
    it '3辺が等しければ正三角形' do
      expect(Triangle.new(1, 1, 1)).to be_equilateral_triangle
    end

    it '3辺が等しいが、三角形の条件を満たさない場合は正三角形ではない' do
      expect(Triangle.new(0, 0, 0.0)).not_to be_equilateral_triangle
    end
  end

  describe '#to_s' do
    it '正三角形ならば正三角形の文字列' do
      expect(Triangle.new(1, 1, 1).to_s).to eq '正三角形ですね！'
    end

    it '二等辺三角形ならば二等辺三角形の文字列' do
      expect(Triangle.new(1, 2, 2).to_s).to eq '二等辺三角形ですね！'
    end

    it '不等辺三角形ならば不等辺三角形の文字列' do
      expect(Triangle.new(1, 1.1, 2).to_s).to eq '不等辺三角形ですね！'
    end

    it '三角形でないならば三角形でない文字列' do
      expect(Triangle.new(0, 0, 0).to_s).to eq '三角形じゃないです＞＜'
    end
  end
end

