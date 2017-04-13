require 'test_helper'

class AwsubsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @awsub = awsubs(:one)
  end

  test "should get index" do
    get awsubs_url
    assert_response :success
  end

  test "should get new" do
    get new_awsub_url
    assert_response :success
  end

  test "should create awsub" do
    assert_difference('Awsub.count') do
      post awsubs_url, params: { awsub: { amedium: @awsub.amedium, asmall: @awsub.asmall, sinop: @awsub.sinop, title: @awsub.title } }
    end

    assert_redirected_to awsub_url(Awsub.last)
  end

  test "should show awsub" do
    get awsub_url(@awsub)
    assert_response :success
  end

  test "should get edit" do
    get edit_awsub_url(@awsub)
    assert_response :success
  end

  test "should update awsub" do
    patch awsub_url(@awsub), params: { awsub: { amedium: @awsub.amedium, asmall: @awsub.asmall, sinop: @awsub.sinop, title: @awsub.title } }
    assert_redirected_to awsub_url(@awsub)
  end

  test "should destroy awsub" do
    assert_difference('Awsub.count', -1) do
      delete awsub_url(@awsub)
    end

    assert_redirected_to awsubs_url
  end
end
