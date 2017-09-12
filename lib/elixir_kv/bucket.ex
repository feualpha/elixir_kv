defmodule ElixirKv.Bucket do
  use Agent

  @doc """
  Start a new Bucket using Agent
  """
  def start_link(_opts0) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets the value from the bucket by ley
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the value for given bucket
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end
  
  @doc """
  delete key and return the value if the key exist
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
