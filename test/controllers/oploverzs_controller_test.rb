require 'test_helper'

class OploverzsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oploverz = oploverzs(:one)
  end

  test "should get index" do
    get oploverzs_url
    assert_response :success
  end

  test "should get new" do
    get new_oploverz_url
    assert_response :success
  end

  test "should create oploverz" do
    assert_difference('Oploverz.count') do
      post oploverzs_url, params: { oploverz: { medium: @oploverz.medium, sinops: @oploverz.sinops, small: @oploverz.small, title: @oploverz.title } }
    end

    assert_redirected_to oploverz_url(Oploverz.last)
  end

  test "should show oploverz" do
    get oploverz_url(@oploverz)
    assert_response :success
  end

  test "should get edit" do
    get edit_oploverz_url(@oploverz)
    assert_response :success
  end

  test "should update oploverz" do
    patch oploverz_url(@oploverz), params: { oploverz: { medium: @oploverz.medium, sinops: @oploverz.sinops, small: @oploverz.small, title: @oploverz.title } }
    assert_redirected_to oploverz_url(@oploverz)
  end

  test "should destroy oploverz" do
    assert_difference('Oploverz.count', -1) do
      delete oploverz_url(@oploverz)
    end

    assert_redirected_to oploverzs_url
  end
end
