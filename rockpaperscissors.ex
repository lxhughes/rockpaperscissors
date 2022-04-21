defmodule Game do

  @options %{0 => "rock", 1 => "paper", 2 => "scissors"} 

  def iChoose() do
    Enum.random(0..2)
  end

  def youChoose(x) do
      cond do
        x == "r" -> 0
        x == "p" -> 1
        x == "s" -> 2
        true -> -1
      end
  end

  def explainer(youChose, iChose) do
    pair = [youChose, iChose]

    cond do
      Enum.all?([0, 1], fn x -> x in pair end) -> "Paper covers rock. "
      Enum.all?([0, 2], fn x -> x in pair end) -> "Rock breaks scissors. "
      Enum.all?([1, 2], fn x -> x in pair end) -> "Scissors cuts paper. "
      youChose == iChose -> ""
      true -> "Not sure how to explain this one. "
    end
  end

  def whoWon(youChose, iChose) do
    diff = youChose - iChose

    cond do
      diff == 0 -> "Draw!"
      diff == -1 || diff == 2 -> "I win!"
      diff == -2 || diff == 1 -> "You win!"
      true -> "Not sure who won."
    end
  end

  def compare(x) do    
    youChose = youChoose(x)

    unless youChose < 0 do
      iChose = iChoose()
     "You chose #{@options[youChose]}. "
      <> "I chose #{@options[iChose]}. " 
      <> explainer(youChose, iChose)
      <> whoWon(youChose, iChose)
    else
      "Invalid response"
    end

  end

end

"Enter r (rock), p (paper), or s (scissors)" 
  |> IO.gets() 
  |> String.trim()
  |> String.downcase() 
  |> Game.compare() 
  |> IO.puts()