require 'test_helper'

class TonansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tonan = tonans(:one)
  end

  test "should get index" do
    get tonans_url
    assert_response :success
  end

  test "should get new" do
    get new_tonan_url
    assert_response :success
  end

  test "should create tonan" do
    assert_difference('Tonan.count') do
      post tonans_url, params: { tonan: { medium: @tonan.medium, sinop: @tonan.sinop, small: @tonan.small, title: @tonan.title } }
    end

    assert_redirected_to tonan_url(Tonan.last)
  end

  test "should show tonan" do
    get tonan_url(@tonan)
    assert_response :success
  end

  test "should get edit" do
    get edit_tonan_url(@tonan)
    assert_response :success
  end

  test "should update tonan" do
    patch tonan_url(@tonan), params: { tonan: { medium: @tonan.medium, sinop: @tonan.sinop, small: @tonan.small, title: @tonan.title } }
    assert_redirected_to tonan_url(@tonan)
  end

  test "should destroy tonan" do
    assert_difference('Tonan.count', -1) do
      delete tonan_url(@tonan)
    end

    assert_redirected_to tonans_url
  end
end
