require 'test_helper'

class MovieusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movieu = movieus(:one)
  end

  test "should get index" do
    get movieus_url
    assert_response :success
  end

  test "should get new" do
    get new_movieu_url
    assert_response :success
  end

  test "should create movieu" do
    assert_difference('Movieu.count') do
      post movieus_url, params: { movieu: { gstream: @movieu.gstream, lstream: @movieu.lstream, mstream: @movieu.mstream, nstream: @movieu.nstream, title: @movieu.title } }
    end

    assert_redirected_to movieu_url(Movieu.last)
  end

  test "should show movieu" do
    get movieu_url(@movieu)
    assert_response :success
  end

  test "should get edit" do
    get edit_movieu_url(@movieu)
    assert_response :success
  end

  test "should update movieu" do
    patch movieu_url(@movieu), params: { movieu: { gstream: @movieu.gstream, lstream: @movieu.lstream, mstream: @movieu.mstream, nstream: @movieu.nstream, title: @movieu.title } }
    assert_redirected_to movieu_url(@movieu)
  end

  test "should destroy movieu" do
    assert_difference('Movieu.count', -1) do
      delete movieu_url(@movieu)
    end

    assert_redirected_to movieus_url
  end
end
