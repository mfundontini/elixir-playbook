defmodule Identicon do
  
  def main(input) do
    input
    |> generate_hash
    |> get_colour
    |> build_grid
  end

  def generate_hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def get_colour(%Identicon.Image{hex: [red, green, blue | _rest ]} = image) do
    %Identicon.Image{image | colour: {red, green, blue}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> mirror_rows
  end

  def mirror_rows(list) do
    for row <- list do
        [first, second, third] = row
        [first, second, third, second, first]
    end
  end

end
