defmodule EvacuationCenterWeb.PageController do
  use EvacuationCenterWeb, :controller

  def index(conn, _params) do
    centers = EvacuationCenter.Evacuation.list_centers
    IO.inspect(centers)
    render(conn, "index.html", centers: centers)
  end
end
