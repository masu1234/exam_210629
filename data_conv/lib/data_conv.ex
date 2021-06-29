defmodule DataConv do

  def main do
    data = readFile("assets/cube.gts")
    list1 = getStat(data)
    list2 = getVtx(Enum.at(list1,1))
    list3 = getLineSeg(Enum.at(list2,1))
    list4 = getTriangle(Enum.at(list3,1))

    m1 = Enum.at(list1,0)
    m2 = Enum.at(list2,0)
    m3 = Enum.at(list3,0)
    m4 = Enum.at(list4,0)

    map = Map.merge(m1,m2)
    |> Map.merge(m3)
    |> Map.merge(m4)

    map

    #map.status
  end


  def readFile(filename) do
      {_status, data} = File.read(filename)
      data
  end

  def getStat(data) do
    data_list = String.split(data, "\r\n")
    data_hd = hd(data_list)
    tale = tl(data_list)
    data_hd = String.split(data_hd, " ")
    data_hd = Enum.map(data_hd, fn x -> String.to_integer(x) end)
    #%{"status" => %{"vtx_num"=> 8, "ls_num"=> 8, "tri_num"=> 8}}


    map = %{:status => Enum.zip([:vtx_num, :ls_num, :tri_num], data_hd)}
    [map, tale]
  end

  def getVtx(list) do
    vtx_list = Enum.take(list, 8)
    left_list = Enum.take(list, -length(list)+8)

    vtx_list = Enum.map(vtx_list, fn x -> String.split(x, " ") end)
    |> Enum.map(fn x -> Enum.reject(x, fn el -> el == "" end) end)

    map = %{:vertex => vtx_list}
    [map, left_list]
  end

  def getLineSeg(list) do
    line_seg_list = Enum.take(list, 18)
    left_list = Enum.take(list, -length(list)+18)

    line_seg_list = Enum.map(line_seg_list, fn x -> String.split(x, " ") end)
    |> Enum.map(fn x -> Enum.reject(x, fn el -> el == "" end) end)

    map = %{:line_seg => line_seg_list}
    [map, left_list]
  end

  def getTriangle(list) do
    triangle_list = Enum.take(list, 12)
    left_list = Enum.take(list, -length(list)+12)

    triangle_list = Enum.map(triangle_list, fn x -> String.split(x, " ") end)
    |> Enum.map(fn x -> Enum.reject(x, fn el -> el == "" end) end)

    map = %{:triangle => triangle_list}
    [map, left_list]
  end

end
