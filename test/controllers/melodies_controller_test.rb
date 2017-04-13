require 'test_helper'

class MelodiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @melody = melodies(:one)
  end

  test "should get index" do
    get melodies_url
    assert_response :success
  end

  test "should get new" do
    get new_melody_url
    assert_response :success
  end

  test "should create melody" do
    assert_difference('Melody.count') do
      post melodies_url, params: { melody: { mmedium: @melody.mmedium, msinop: @melody.msinop, msmall: @melody.msmall, mtitle: @melody.mtitle } }
    end

    assert_redirected_to melody_url(Melody.last)
  end

  test "should show melody" do
    get melody_url(@melody)
    assert_response :success
  end

  test "should get edit" do
    get edit_melody_url(@melody)
    assert_response :success
  end

  test "should update melody" do
    patch melody_url(@melody), params: { melody: { mmedium: @melody.mmedium, msinop: @melody.msinop, msmall: @melody.msmall, mtitle: @melody.mtitle } }
    assert_redirected_to melody_url(@melody)
  end

  test "should destroy melody" do
    assert_difference('Melody.count', -1) do
      delete melody_url(@melody)
    end

    assert_redirected_to melodies_url
  end
end
