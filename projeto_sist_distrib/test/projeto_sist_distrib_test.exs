defmodule ProjetoSistDistribTest do
  use ExUnit.Case, async: true
  doctest ProjetoSistDistrib

  test "greets the world" do
    assert ProjetoSistDistrib.hello() == :world
  end
end

defmodule BucketTest do
  use ExUnit.Case, async: true
  doctest Bucket

  setup do
    {:ok, bucket} = Bucket.start_link([])
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    assert Bucket.get(bucket, "milk") == nil # Verifica se a chave leite não está no bucket

    Bucket.put(bucket, "milk", 3)
    assert Bucket.get(bucket, "milk") == 3 # Verifica se a chave leite está no bucket com valor 3

    Bucket.put(bucket, "banana", 5)
    assert Bucket.get(bucket, "banana") == 5
  end
end
