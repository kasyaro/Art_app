require 'test_helper'

class ArtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @art = arts(:one)
  end

  test "should get index" do
    get arts_url, as: :json
    assert_response :success
  end

  test "should create art" do
    assert_difference('Art.count') do
      post arts_url, params: { art: { description: @art.description, img: @art.img, material: @art.material, medium: @art.medium, size: @art.size, style: @art.style, title: @art.title } }, as: :json
    end

    assert_response 201
  end

  test "should show art" do
    get art_url(@art), as: :json
    assert_response :success
  end

  test "should update art" do
    patch art_url(@art), params: { art: { description: @art.description, img: @art.img, material: @art.material, medium: @art.medium, size: @art.size, style: @art.style, title: @art.title } }, as: :json
    assert_response 200
  end

  test "should destroy art" do
    assert_difference('Art.count', -1) do
      delete art_url(@art), as: :json
    end

    assert_response 204
  end
end
