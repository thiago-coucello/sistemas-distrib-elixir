defmodule Compras do
  use Agent

  @doc """
  Inicia uma lista de compras
  """
  def comecar_lista() do
    # Inicia o agente com uma lista vazia
    Agent.start_link(fn -> [] end)
  end

  @doc """
  Adiciona um item a uma lista de compras
  """
  def adicionar(lista, item) do
    Agent.update(lista, fn l -> [item | l] end)
  end

  @doc """
  Recupera a lista de compras do agente
  """
  def recuperar(lista) do
    Agent.get(lista, fn lista -> lista end)
  end

end
