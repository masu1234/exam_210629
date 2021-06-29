defmodule EvacuationCenterWeb.PageController do
  use EvacuationCenterWeb, :controller

  alias EvacuationCenter.Evacuation
  alias EvacuationCenter.Codes.Util

  def index(conn, _params) do
    centers = EvacuationCenter.Evacuation.list_centers
    IO.inspect(centers)
    render(conn, "index.html", centers: centers)
  end

  def show(conn, %{"city" => city}) do
    centers = Util.get_posts_by_city!(city)
    render(conn, "index.html", centers: centers)
  end
end
