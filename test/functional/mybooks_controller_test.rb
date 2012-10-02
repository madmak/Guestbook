require 'test_helper'

class MybooksControllerTest < ActionController::TestCase
  setup do
    @mybook = mybooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mybooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mybook" do
    assert_difference('Mybook.count') do
      post :create, :mybook => { :intime => @mybook.intime, :name => @mybook.name, :when => @mybook.when, :wish => @mybook.wish }
    end

    assert_redirected_to mybook_path(assigns(:mybook))
  end

  test "should show mybook" do
    get :show, :id => @mybook
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mybook
    assert_response :success
  end

  test "should update mybook" do
    put :update, :id => @mybook, :mybook => { :intime => @mybook.intime, :name => @mybook.name, :when => @mybook.when, :wish => @mybook.wish }
    assert_redirected_to mybook_path(assigns(:mybook))
  end

  test "should destroy mybook" do
    assert_difference('Mybook.count', -1) do
      delete :destroy, :id => @mybook
    end

    assert_redirected_to mybooks_path
  end
end
