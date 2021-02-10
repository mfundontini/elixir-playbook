defmodule Identicon do
  
  def main(input) do
    input
    |> generate_hash
  end

  def generate_hash(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end
end
