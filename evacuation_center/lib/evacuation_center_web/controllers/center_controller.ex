defmodule EvacuationCenterWeb.CenterController do
  use EvacuationCenterWeb, :controller

  alias EvacuationCenter.Evacuation
  alias EvacuationCenter.Evacuation.Center

  def index(conn, _params) do
    centers = Evacuation.list_centers()
    render(conn, "index.html", centers: centers)
  end

  def new(conn, _params) do
    changeset = Evacuation.change_center(%Center{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"center" => center_params}) do
    case Evacuation.create_center(center_params) do
      {:ok, center} ->
        conn
        |> put_flash(:info, "Center created successfully.")
        |> redirect(to: Routes.center_path(conn, :show, center))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    center = Evacuation.get_center!(id)
    render(conn, "show.html", center: center)
  end

  def edit(conn, %{"id" => id}) do
    center = Evacuation.get_center!(id)
    changeset = Evacuation.change_center(center)
    render(conn, "edit.html", center: center, changeset: changeset)
  end

  def update(conn, %{"id" => id, "center" => center_params}) do
    center = Evacuation.get_center!(id)

    case Evacuation.update_center(center, center_params) do
      {:ok, center} ->
        conn
        |> put_flash(:info, "Center updated successfully.")
        |> redirect(to: Routes.center_path(conn, :show, center))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", center: center, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    center = Evacuation.get_center!(id)
    {:ok, _center} = Evacuation.delete_center(center)

    conn
    |> put_flash(:info, "Center deleted successfully.")
    |> redirect(to: Routes.center_path(conn, :index))
  end
end
