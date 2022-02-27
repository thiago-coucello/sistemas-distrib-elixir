defmodule ClientAPI do
  ## Client API

  @doc """
  Starts the registry.
  """
  def start_link(opts) do
    # Cria um novo GenServer passando uma lista de opções
    # BucketRegistry - O módulo onde os retornos estão implementados
    # :ok            - O argumento de inicialização
    # opts           - Uma lista de opções que podem ser passadas ao criar o GenServer
    # especificando coisas como o nome do servidor etc.
    GenServer.start_link(BucketRegistry, :ok, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Returns `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  #Responsável por enviar a requisição solicitando um processo pelo nome
  def lookup(server, name) do
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  #Responsável por enviar uma requisição solicitando a criação de um processo e passando o nome dele
  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end
end
