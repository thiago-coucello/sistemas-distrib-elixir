defmodule Padrao do
  # O argumento sep recebe por padrão a string "/"
  def formata_data(dia, mes, ano, sep \\ "/"), do: dia <> sep <> mes <> sep <> ano
end

IO.puts Padrao.formata_data("3", "3", "2022") # 3/3/2022
IO.puts Padrao.formata_data("3", "3", "2022", "-")  # 3-3-2022

defmodule Concat do
  # Função principal com os valores padrões de cada argumento
  def join(a, b \\ nil, sep \\ " ")

  # Função para caso b seja nil
  # o "_" antes de sep indica que esse argumento é ignorado na função (Convenção de nomenclatura)
  def join(a, b, _sep) when is_nil(b), do: a

  # Função para caso b não seja nulo
  def join(a, b, sep), do: a <> sep <> b
end

IO.puts Concat.join("texto")  # texto
IO.puts Concat.join("texto", nil, "-") # texto
IO.puts Concat.join("texto", "concatenado") # texto concatenado
IO.puts Concat.join("texto", "concatenado", "-") # texto-concatenado
