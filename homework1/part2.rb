require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
  #homework stuff
  def test_raise_wrong_number_players
    assert_raise (WrongNumberOfPlayersError) {rps_game_winner([["Armando", "S"]])}
  end

  def test_raise_no_such_strategy
  	assert_raise (NoSuchStrategyError) {rps_game_winner([["Armando", "S"], ["Urmas", "A"]])}
  end

  def test_paper_winner
    assert_equal ["Urmas", "P"], rps_game_winner([["Armando", "R"], ["Urmas", "P"]])
  end

  def test_rock_winner
    assert_equal ["Armando", "R"], rps_game_winner([["Armando", "R"], ["Urmas", "S"]])
  end

  def test_first_winner
    assert_equal ["Armando", "R"], rps_game_winner([["Armando", "R"], ["Urmas", "R"]])
  end

  def test_scissors_winner
    assert_equal ["Armando", "S"], rps_game_winner([["Armando", "S"], ["Urmas", "P"]])
  end

  def test_scissors_winner_reverse
    assert_equal ["Armando", "S"], rps_game_winner([["Urmas", "P"], ["Armando", "S"]])
  end 
  

  def test_rps_tournament_winner
    assert_equal ["Richard", "R"], rps_tournament_winner([[[ ["Armando", "P"], ["Dave", "S"] ],[ ["Richard", "R"], ["Michael", "S"] ],
],[[ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ]])
  end 

  def test_rps_tournament_winner2
    assert_equal ["Richard", "R"], rps_tournament_winner(
        [[["Armando", "P"], ["Dave", "S"]] , [["Richard", "R"], ["Michael", "S"]]]
      )
  end

  def test_rps_tournament_winner3
    assert_equal ["Richard", "R"], rps_tournament_winner(
      [[[[ ["Armando", "P"], ["Dave", "S"] ],[ ["Richard", "R"], ["Michael", "S"] ],
],[[ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ]], [[[ ["Armando", "P"], ["Dave", "S"] ],[ ["Richard", "R"], ["Michael", "S"] ],
],[[ ["Allen", "S"], ["Omer", "P"] ], [ ["David E.", "R"], ["Richard X.", "P"] ] ]]])
  end
      
  #pobochnqe unit testq
  def test_evaluate_option_false
  	assert_equal false, correctStrategy?([["Armando", "S"], ["Urmas", "A"]], {"S" => 1, "R" => 2 , "P" => 3})
  end

  def test_evaluate_option_true
    assert correctStrategy?([["Armando", "S"], ["Urmas", "P"]], {"S" => 1, "R" => 2 , "P" => 3}) 
  end
end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end



def rps_tournament_winner(tournamentEntry)
  begin
    rps_game_winner(tournamentEntry)
  rescue
    rps_tournament_winner([rps_tournament_winner(tournamentEntry[0]), rps_tournament_winner(tournamentEntry[1])])
  end
end

def rps_game_winner(game)
	possibleValues = {"S" => 1, "R" => 2 , "P" => 3}
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless correctStrategy?(game, possibleValues)

  if possibleValues[game[0][1]].eql?(1) & possibleValues[game[1][1]].eql?(3) then
    return game[0]
  elsif possibleValues[game[0][1]] < possibleValues[game[1][1]] || possibleValues[game[0][1]].eql?(3) & possibleValues[game[1][1]].eql?(1) then
    return game[1]
  elsif possibleValues[game[0][1]] > possibleValues[game[1][1]] || possibleValues[game[0][1]] == possibleValues[game[1][1]] then
    return game[0]           
  end
end

def correctStrategy?(gameAnswer, possibleValues)
	gameAnswer.each {|playerMove| return false if !possibleValues.key?(playerMove[1])}
	return true
end