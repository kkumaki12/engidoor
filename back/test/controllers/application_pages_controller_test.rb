require 'test_helper'

class ApplicationPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_path
    assert_response :success
  end
end
