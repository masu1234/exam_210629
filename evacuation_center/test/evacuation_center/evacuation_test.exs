defmodule EvacuationCenter.EvacuationTest do
  use EvacuationCenter.DataCase

  alias EvacuationCenter.Evacuation

  describe "centers" do
    alias EvacuationCenter.Evacuation.Center

    @valid_attrs %{adress: "some adress", area: "some area", city: "some city", lat: 120.5, lng: 120.5, name: "some name", prefecture: "some prefecture"}
    @update_attrs %{adress: "some updated adress", area: "some updated area", city: "some updated city", lat: 456.7, lng: 456.7, name: "some updated name", prefecture: "some updated prefecture"}
    @invalid_attrs %{adress: nil, area: nil, city: nil, lat: nil, lng: nil, name: nil, prefecture: nil}

    def center_fixture(attrs \\ %{}) do
      {:ok, center} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Evacuation.create_center()

      center
    end

    test "list_centers/0 returns all centers" do
      center = center_fixture()
      assert Evacuation.list_centers() == [center]
    end

    test "get_center!/1 returns the center with given id" do
      center = center_fixture()
      assert Evacuation.get_center!(center.id) == center
    end

    test "create_center/1 with valid data creates a center" do
      assert {:ok, %Center{} = center} = Evacuation.create_center(@valid_attrs)
      assert center.adress == "some adress"
      assert center.area == "some area"
      assert center.city == "some city"
      assert center.lat == 120.5
      assert center.lng == 120.5
      assert center.name == "some name"
      assert center.prefecture == "some prefecture"
    end

    test "create_center/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Evacuation.create_center(@invalid_attrs)
    end

    test "update_center/2 with valid data updates the center" do
      center = center_fixture()
      assert {:ok, %Center{} = center} = Evacuation.update_center(center, @update_attrs)
      assert center.adress == "some updated adress"
      assert center.area == "some updated area"
      assert center.city == "some updated city"
      assert center.lat == 456.7
      assert center.lng == 456.7
      assert center.name == "some updated name"
      assert center.prefecture == "some updated prefecture"
    end

    test "update_center/2 with invalid data returns error changeset" do
      center = center_fixture()
      assert {:error, %Ecto.Changeset{}} = Evacuation.update_center(center, @invalid_attrs)
      assert center == Evacuation.get_center!(center.id)
    end

    test "delete_center/1 deletes the center" do
      center = center_fixture()
      assert {:ok, %Center{}} = Evacuation.delete_center(center)
      assert_raise Ecto.NoResultsError, fn -> Evacuation.get_center!(center.id) end
    end

    test "change_center/1 returns a center changeset" do
      center = center_fixture()
      assert %Ecto.Changeset{} = Evacuation.change_center(center)
    end
  end
end
