defmodule EvacuationCenterWeb.PageController do
  use EvacuationCenterWeb, :controller

  alias EvacuationCenter.Evacuation
  alias EvacuationCenter.Codes.Util
  alias EvacuationCenter.Evacuation.Center
  alias EvacuationCenter.Repo

  def index(conn, _params) do
    changeset = Center.changeset(%Center{}, %{})
    centers = EvacuationCenter.Evacuation.list_centers
    render(conn, "index.html", centers: centers, changeset: changeset)
  end

  #def show(conn, %{"city" => city}) do
  def show(conn, params) do
    require Ecto.Query

    city = params["center"]["city"]
    changeset = Center.changeset(%Center{}, %{})
    centers = EvacuationCenter.Evacuation.list_centers
    query = Ecto.Query.where(Center, city: ^city)
    centers = Repo.all(query)

    render(conn, "index.html",centers: centers, city: city, changeset: changeset)
  end
end
