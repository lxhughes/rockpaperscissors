defmodule GameTest do
	use ExUnit.Case, async: true

	test "I choose 0, 1, or 2" do
		assert Game.iChoose >= 0 && Game.iChoose() <= 2
	end
end