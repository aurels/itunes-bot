require 'test/unit'
require './lib/utils'

class UtilsTest < Test::Unit::TestCase
  def test_001
    assert_equal "", Utils.clean("")
  end
  
  def test_002
    assert_equal "DJ Cutkiller", Utils.clean("dj cutkiller")
  end
    
  def test_003
    assert_equal "Jean-Michel Est un Con, ou ,Fils de Con (Connard)", Utils.clean("jean-michel est un con, ou ,fils de con (connard)")
  end
  
  def test_004
    assert_equal "Nuthin' But a G Thang", Utils.clean("nuthin' but a g thang")
  end
    
  def test_005
    assert_equal "Super Song by DJ Rush", Utils.clean("super song by dj rush")
  end
    
  def test_006
    assert_equal "Il Faut Danser", Utils.clean("il faut danser")
  end
  
  def test_007
    assert_equal "Gross (ft. Boom Pam)", Utils.clean("gross (feat. boom pam)")
  end
  
  def test_008
    assert_equal "Bulgarian Chicks (ft. Vlada Tomova, Kristin Espeland)", Utils.clean("bulgarian chicks (feat. vlada tomova, kristin espeland)")
  end
    
  def test_009
    assert_equal "It's Going Down", Utils.clean("it's going down")
  end
    
  def test_010
    assert_equal "The X-Ecutioners", Utils.clean("the x-ecutioners")
  end
    
  def test_011
    assert_equal "Great DJ", Utils.clean("great dj")
  end
end