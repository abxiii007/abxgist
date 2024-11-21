defmodule AbxGist.GistsTest do
  use AbxGist.DataCase

  alias AbxGist.Gists

  describe "gists" do
    alias AbxGist.Gists.Gist

    import AbxGist.GistsFixtures

    @invalid_attrs %{name: nil, description: nil, markup_text: nil}

    test "list_gists/0 returns all gists" do
      gist = gist_fixture()
      assert Gists.list_gists() == [gist]
    end

    test "get_gist!/1 returns the gist with given id" do
      gist = gist_fixture()
      assert Gists.get_gist!(gist.id) == gist
    end

    test "create_gist/1 with valid data creates a gist" do
      valid_attrs = %{name: "some name", description: "some description", markup_text: "some markup_text"}

      assert {:ok, %Gist{} = gist} = Gists.create_gist(valid_attrs)
      assert gist.name == "some name"
      assert gist.description == "some description"
      assert gist.markup_text == "some markup_text"
    end

    test "create_gist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gists.create_gist(@invalid_attrs)
    end

    test "update_gist/2 with valid data updates the gist" do
      gist = gist_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", markup_text: "some updated markup_text"}

      assert {:ok, %Gist{} = gist} = Gists.update_gist(gist, update_attrs)
      assert gist.name == "some updated name"
      assert gist.description == "some updated description"
      assert gist.markup_text == "some updated markup_text"
    end

    test "update_gist/2 with invalid data returns error changeset" do
      gist = gist_fixture()
      assert {:error, %Ecto.Changeset{}} = Gists.update_gist(gist, @invalid_attrs)
      assert gist == Gists.get_gist!(gist.id)
    end

    test "delete_gist/1 deletes the gist" do
      gist = gist_fixture()
      assert {:ok, %Gist{}} = Gists.delete_gist(gist)
      assert_raise Ecto.NoResultsError, fn -> Gists.get_gist!(gist.id) end
    end

    test "change_gist/1 returns a gist changeset" do
      gist = gist_fixture()
      assert %Ecto.Changeset{} = Gists.change_gist(gist)
    end
  end

  describe "saved_gists" do
    alias AbxGist.Gists.SaveedGist

    import AbxGist.GistsFixtures

    @invalid_attrs %{}

    test "list_saved_gists/0 returns all saved_gists" do
      saveed_gist = saveed_gist_fixture()
      assert Gists.list_saved_gists() == [saveed_gist]
    end

    test "get_saveed_gist!/1 returns the saveed_gist with given id" do
      saveed_gist = saveed_gist_fixture()
      assert Gists.get_saveed_gist!(saveed_gist.id) == saveed_gist
    end

    test "create_saveed_gist/1 with valid data creates a saveed_gist" do
      valid_attrs = %{}

      assert {:ok, %SaveedGist{} = saveed_gist} = Gists.create_saveed_gist(valid_attrs)
    end

    test "create_saveed_gist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gists.create_saveed_gist(@invalid_attrs)
    end

    test "update_saveed_gist/2 with valid data updates the saveed_gist" do
      saveed_gist = saveed_gist_fixture()
      update_attrs = %{}

      assert {:ok, %SaveedGist{} = saveed_gist} = Gists.update_saveed_gist(saveed_gist, update_attrs)
    end

    test "update_saveed_gist/2 with invalid data returns error changeset" do
      saveed_gist = saveed_gist_fixture()
      assert {:error, %Ecto.Changeset{}} = Gists.update_saveed_gist(saveed_gist, @invalid_attrs)
      assert saveed_gist == Gists.get_saveed_gist!(saveed_gist.id)
    end

    test "delete_saveed_gist/1 deletes the saveed_gist" do
      saveed_gist = saveed_gist_fixture()
      assert {:ok, %SaveedGist{}} = Gists.delete_saveed_gist(saveed_gist)
      assert_raise Ecto.NoResultsError, fn -> Gists.get_saveed_gist!(saveed_gist.id) end
    end

    test "change_saveed_gist/1 returns a saveed_gist changeset" do
      saveed_gist = saveed_gist_fixture()
      assert %Ecto.Changeset{} = Gists.change_saveed_gist(saveed_gist)
    end
  end
end
