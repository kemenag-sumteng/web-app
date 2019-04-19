require "application_system_test_case"

class PenggunaTest < ApplicationSystemTestCase
  setup do
    @pengguna = pengguna(:one)
  end

  test "visiting the index" do
    visit pengguna_url
    assert_selector "h1", text: "Pengguna"
  end

  test "creating a Pengguna" do
    visit pengguna_url
    click_on "New Pengguna"

    fill_in "Email", with: @pengguna.email
    fill_in "Nama lengkap", with: @pengguna.nama_lengkap
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    click_on "Create Pengguna"

    assert_text "Pengguna was successfully created"
    click_on "Back"
  end

  test "updating a Pengguna" do
    visit pengguna_url
    click_on "Edit", match: :first

    fill_in "Email", with: @pengguna.email
    fill_in "Nama lengkap", with: @pengguna.nama_lengkap
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    click_on "Update Pengguna"

    assert_text "Pengguna was successfully updated"
    click_on "Back"
  end

  test "destroying a Pengguna" do
    visit pengguna_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pengguna was successfully destroyed"
  end
end
