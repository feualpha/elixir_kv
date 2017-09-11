defmodule ElixirKv.BucketTest do
  use ExUnit.Case, async: true
  test "stores values by key" do
    {:ok, bucket} = start_supervised ElixirKv.Bucket
    assert ElixirKv.Bucket.get(bucket, "milk") == nil
    
    ElixirKv.Bucket.put(bucket, "milk", 3)
    assert ElixirKv.Bucket.get(bucket,"milk") == 3
  end
end
