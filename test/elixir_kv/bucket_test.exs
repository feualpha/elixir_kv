defmodule ElixirKv.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = start_supervised ElixirKv.Bucket
    %{bucket: bucket}
  end

  test "stores values by key and delete", %{bucket: bucket} do    
    assert ElixirKv.Bucket.get(bucket, "milk") == nil
    
    ElixirKv.Bucket.put(bucket, "milk", 3)
    assert ElixirKv.Bucket.get(bucket,"milk") == 3

    ElixirKv.Bucket.delete(bucket, "milk")
    assert ElixirKv.Bucket.get(bucket, "milk") == nil
  end
end
