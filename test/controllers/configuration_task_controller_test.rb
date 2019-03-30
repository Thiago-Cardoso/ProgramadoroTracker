require 'test_helper'

class ConfigurationTaskControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get configuration_task_show_url
    assert_response :success
  end

  test "should get index" do
    get configuration_task_index_url
    assert_response :success
  end

  test "should get create" do
    get configuration_task_create_url
    assert_response :success
  end

  test "should get update" do
    get configuration_task_update_url
    assert_response :success
  end

  test "should get destroy" do
    get configuration_task_destroy_url
    assert_response :success
  end

end
