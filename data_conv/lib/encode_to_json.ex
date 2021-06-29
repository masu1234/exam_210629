defmodule EncodeToJSON do

  def main do
    {:ok, result} = DataConv.main()
    |> JSON.encode()

    File.write("assets/info.json",result)
  end


end
