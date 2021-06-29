defmodule EvacuationCenterWeb.CenterControllerTest do
  use EvacuationCenterWeb.ConnCase

  alias EvacuationCenter.Evacuation

  @create_attrs %{adress: "some adress", area: "some area", city: "some city", lat: 120.5, lng: 120.5, name: "some name", prefecture: "some prefecture"}
  @update_attrs %{adress: "some updated adress", area: "some updated area", city: "some updated city", lat: 456.7, lng: 456.7, name: "some updated name", prefecture: "some updated prefecture"}
  @invalid_attrs %{adress: nil, area: nil, city: nil, lat: nil, lng: nil, name: nil, prefecture: nil}

  def fixture(:center) do
    {:ok, center} = Evacuation.create_center(@create_attrs)
    center
  end

  describe "index" do
    test "lists all centers", %{conn: conn} do
      conn = get(conn, Routes.center_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Centers"
    end
  end

  describe "new center" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.center_path(conn, :new))
      assert html_response(conn, 200) =~ "New Center"
    end
  end

  describe "create center" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.center_path(conn, :create), center: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.center_path(conn, :show, id)

      conn = get(conn, Routes.center_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Center"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.center_path(conn, :create), center: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Center"
    end
  end

  describe "edit center" do
    setup [:create_center]

    test "renders form for editing chosen center", %{conn: conn, center: center} do
      conn = get(conn, Routes.center_path(conn, :edit, center))
      assert html_response(conn, 200) =~ "Edit Center"
    end
  end

  describe "update center" do
    setup [:create_center]

    test "redirects when data is valid", %{conn: conn, center: center} do
      conn = put(conn, Routes.center_path(conn, :update, center), center: @update_attrs)
      assert redirected_to(conn) == Routes.center_path(conn, :show, center)

      conn = get(conn, Routes.center_path(conn, :show, center))
      assert html_response(conn, 200) =~ "some updated adress"
    end

    test "renders errors when data is invalid", %{conn: conn, center: center} do
      conn = put(conn, Routes.center_path(conn, :update, center), center: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Center"
    end
  end

  describe "delete center" do
    setup [:create_center]

    test "deletes chosen center", %{conn: conn, center: center} do
      conn = delete(conn, Routes.center_path(conn, :delete, center))
      assert redirected_to(conn) == Routes.center_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.center_path(conn, :show, center))
      end
    end
  end

  defp create_center(_) do
    center = fixture(:center)
    %{center: center}
  end
end
