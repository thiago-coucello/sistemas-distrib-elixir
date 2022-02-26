defmodule Math do
  # O ? no final indica que as funções retornam booleano (convenção de nomenclatura no Elixir)
  def par?(2) do
    true
  end

  def par?(num) when is_integer(num) do
    rem(num, 2) == 0
  end
end

IO.puts Math.par?(2)  # true
IO.puts Math.par?(4)  # true
IO.puts Math.par?(1)  # false
