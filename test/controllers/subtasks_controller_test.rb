require "test_helper"

class SubtasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subtasks_index_url
    assert_response :success
  end

  test "should get show" do
    get subtasks_show_url
    assert_response :success
  end

  test "should get edit" do
    get subtasks_edit_url
    assert_response :success
  end

  test "should get delete" do
    get subtasks_delete_url
    assert_response :success
  end
end
