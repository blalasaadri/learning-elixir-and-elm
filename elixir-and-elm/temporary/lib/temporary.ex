defmodule Temporary do
  @moduledoc """
  Documentation for Temporary.
  """

  @doc """
  Add up two numbers.

  ## Examples

      iex> Temporary.add(0, 0)
      0

      iex> Temporary.add(0, 2)
      2

      iex> Temporary.add(3, 0)
      3

      iex> Temporary.add(1, 1)
      2

  """
  def add(0, 0), do: 0
  def add(0, y) when is_number(y), do: y
  def add(x, 0) when is_number(x), do: x
  def add(x, y) when is_number(x) and is_number(y), do: x + y
end
