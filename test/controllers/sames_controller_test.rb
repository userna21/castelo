require 'test_helper'

class SamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @same = sames(:one)
  end

  test "should get index" do
    get sames_url
    assert_response :success
  end

  test "should get new" do
    get new_same_url
    assert_response :success
  end

  test "should create same" do
    assert_difference('Same.count') do
      post sames_url, params: { same: { lmedium1: @same.lmedium1, lmedium2: @same.lmedium2, lsmall1: @same.lsmall1, lsmall2: @same.lsmall2, title: @same.title } }
    end

    assert_redirected_to same_url(Same.last)
  end

  test "should show same" do
    get same_url(@same)
    assert_response :success
  end

  test "should get edit" do
    get edit_same_url(@same)
    assert_response :success
  end

  test "should update same" do
    patch same_url(@same), params: { same: { lmedium1: @same.lmedium1, lmedium2: @same.lmedium2, lsmall1: @same.lsmall1, lsmall2: @same.lsmall2, title: @same.title } }
    assert_redirected_to same_url(@same)
  end

  test "should destroy same" do
    assert_difference('Same.count', -1) do
      delete same_url(@same)
    end

    assert_redirected_to sames_url
  end
end
