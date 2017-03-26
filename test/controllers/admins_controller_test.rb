require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get manage_courses" do
    get admins_manage_courses_url
    assert_response :success
  end

  test "should get manage_instructors" do
    get admins_manage_instructors_url
    assert_response :success
  end

end
