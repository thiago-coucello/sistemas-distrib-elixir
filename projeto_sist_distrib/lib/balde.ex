defmodule Balde do
  use Agent

  @doc """
  Começa um novo balde com um mapa vazio.
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Recupera um valor do mapa por chave.
  """
  def get(balde, chave) do
    Agent.get(balde, &Map.get(&1, chave))
  end

  @doc """
  Bota o `valor` para a `chave` dada dentro do mapa.
  """
  def put(balde, chave, valor) do
    Agent.update(balde, &Map.put(&1, chave, valor))
  end
end
