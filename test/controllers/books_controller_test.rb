require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
    test 'get index' do
      get :index
      assert_response :success
      assert_template :index
      assert_not_nil assigns(:books)
  end
end
