defmodule EvacuationCenter do
  @moduledoc """
  EvacuationCenter keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def main do
    #csvからmaplistに変換
    file_name = "assets/csv/mod_130001_evacuation_center.csv"
    read_file(file_name)

    el = Enum.at(read_file(file_name) ,0)
    el["\uFEFFname"]
    # el["避難所_名称"]


    #[el["避難所＿名称"], el["地方公共団体コード"], el["都道府県"], el["指定区市町村名"], el["住所"], el["緯度"],el["経度"]]


    #maplistをDBに登録
    for el <- read_file(file_name) do
      params = %{name: el["\uFEFFname"], area: el["地方公共団体コード"], prefecture: el["都道府県"], city: el["指定区市町村名"], adress: el["住所"], lng: el["緯度"], lat: el["経度"]}
      EvacuationCenter.Evacuation.create_center(params)
    end
  end

  def read_file(file_name) do
    #ファイルデータをdataに格納、レコードごとに分割してリスト化
    {_status, data} = File.read(file_name)
    data_list = String.split(data, "\r\n")

    #head：["取引先番号,取引先名称...""] tail：それ以降の各レコードが入ったリスト
    head = hd(data_list)
    tail = tl(data_list)

    #headを分割してリスト化
    keys = String.split(head,",")

    for i <- tail do
      data = String.split(i, ",")

      list =
        for j <- 0..(length(keys) - 1) do
          %{Enum.at(keys, j) => Enum.at(data, j)}
        end
      Enum.reduce(list, %{}, fn x, acc -> Map.merge(x, acc) end)

    end
  end
end
