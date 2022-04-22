defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "I choose 0, 1, or 2" do
    assert is_integer(Game.iChoose()) == true
    assert Game.iChoose() >= 0 && Game.iChoose() <= 2
  end

  test "You choose maps correctly" do
    assert Game.youChoose("r") == 0
    assert Game.youChoose("p") == 1
    assert Game.youChoose("s") == 2
    assert Game.youChoose("l") == -1
    assert Game.youChoose("bronco") == -1
  end

  test "Explainer explains correctly" do
    assert Game.explainer(0, 1) == "Paper covers rock. "
    assert Game.explainer(1, 0) == "Paper covers rock. "
    assert Game.explainer(0, 2) == "Rock breaks scissors. "
    assert Game.explainer(2, 0) == "Rock breaks scissors. "
    assert Game.explainer(1, 2) == "Scissors cuts paper. "
    assert Game.explainer(2, 1) == "Scissors cuts paper. "
    assert Game.explainer(0, 0) == ""
    assert Game.explainer(1, 1) == ""
    assert Game.explainer(2, 2) == ""
    assert Game.explainer(0, -1) == "Not sure how to explain this one. "
  end

  test "Correct winner chosen" do
    assert Game.whoWon(0, 1) == "I win!"
    assert Game.whoWon(1, 0) == "You win!"
    assert Game.whoWon(0, 2) == "You win!"
    assert Game.whoWon(2, 0) == "I win!"
    assert Game.whoWon(1, 2) == "I win!"
    assert Game.whoWon(2, 1) == "You win!"
    assert Game.whoWon(0, 0) == "Draw!"
    assert Game.whoWon(1, 1) == "Draw!"
    assert Game.whoWon(2, 2) == "Draw!"
    assert Game.whoWon(0, 3) == "Not sure who won."
  end

end
