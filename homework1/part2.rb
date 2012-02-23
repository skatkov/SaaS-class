require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
  def test_raise_wrong_number_players
    assert_raise WrongNumberOfPlayersError, rps_game_winner([["Armando", "S"]])
  end
end


class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end


def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
  	#code here
end
