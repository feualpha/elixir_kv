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
end
