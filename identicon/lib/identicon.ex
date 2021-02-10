defmodule Identicon do
  
  def main(input) do
    input
    |> generate_hash
    |> get_colour
  end

  def generate_hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def get_colour(image) do
    %Identicon.Image{hex: [red, green, blue | _rest ]} = image

    [red, green, blue]
  end

end
