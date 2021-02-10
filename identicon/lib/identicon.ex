defmodule Identicon do
  
  def main(input) do
    input
    |> generate_hash
    |> get_colour
    |> build_grid
    |> filter_odd
    |> pixel_map
  end

  def generate_hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def get_colour(%Identicon.Image{hex: [red, green, blue | _rest ]} = image) do
    %Identicon.Image{image | colour: {red, green, blue}}
  end

  def build_grid_meh(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> mirror_rows
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid = hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)
    |> List.flatten
    |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  def mirror_rows(list_of_rows) do
    for row <- list_of_rows do
        [first, second, third] = row
        [first, second, third, second, first]
    end
  end

  def mirror_row([first, second | _rest] = row) do
    row ++ [ second, first ]
  end

  def filter_odd(%Identicon.Image{grid: grid} = image) do
    filtered = Enum.filter(grid, fn({value, index} = x) -> rem(value, 2) == 0 end)
    %Identicon.Image{image | grid: filtered}
  end

  def pixel_map(%Identicon.Image{grid: grid} = image) do
    pixels = Enum.map(grid, fn({_value, index} = x) -> coordinates index end)
    %Identicon.Image{image | pixel_map: pixels}
  end

  def coordinates(index) do
    x1 = rem(index, 5) * 50
    y1 = div(index, 5) * 50
    x2 = x1 + 50
    y2 = y1 + 50
    {{x1,y1},{x2,y2}}
  end

end
