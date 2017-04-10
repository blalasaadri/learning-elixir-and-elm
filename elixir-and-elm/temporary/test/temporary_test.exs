defmodule TemporaryTest do
  use ExUnit.Case
  doctest Temporary

  test "the add function takes two integers and adds them up" do
    result = Temporary.add(1, 1)
    assert result == 2
  end

  test "the add functino takes two floats and adds them up" do
    result = Temporary.add(1.5, 2.5)
    assert result == 4.0
  end

  test "the add function returns a number" do
    Temporary.add(1.5, 3.5)
    |> is_number
    |> assert
  end
end
