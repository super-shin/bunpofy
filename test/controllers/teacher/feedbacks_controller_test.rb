require "test_helper"

class Teacher::FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teacher_feedbacks_new_url
    assert_response :success
  end

  test "should get create" do
    get teacher_feedbacks_create_url
    assert_response :success
  end
end
