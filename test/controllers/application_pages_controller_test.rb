require "test_helper"

class ApplicationPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get application_pages_home_url
    assert_response :success
  end
end
