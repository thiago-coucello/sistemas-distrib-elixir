defmodule ProjetoSistDistribTest do
  use ExUnit.Case, async: true
  doctest ProjetoSistDistrib

  test "greets the world" do
    assert ProjetoSistDistrib.hello() == :world
  end
end

defmodule ComprasTeste do
  use ExUnit.Case, async: true
  doctest Compras

  test "Adicionar um item na lista" do
    {:ok, lista} = Compras.comecar_lista()
    assert Compras.recuperar(lista) == []

    Compras.adicionar(lista, "leite")
    assert Compras.recuperar(lista) == ["leite"]
  end
end

defmodule BaldeTeste do
  use ExUnit.Case, async: true
  doctest Balde

  setup do
    {:ok, balde} = Balde.start_link([])
    %{balde: balde}
  end

  test "stores values by key", %{balde: balde} do
    assert Balde.get(balde, "leite") == nil # Verifica se a chave leite não está no balde

    Balde.put(balde, "leite", 3)
    assert Balde.get(balde, "leite") == 3 # Verifica se a chave leite está no balde com valor 3

    Balde.put(balde, "banana", 5)
    assert Balde.get(balde, "banana") == 5
  end
end
