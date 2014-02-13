require 'test_helper'

class WorkCardsControllerTest < ActionController::TestCase
  setup do
    @work_card = work_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_card" do
    assert_difference('WorkCard.count') do
      post :create, work_card: { end: @work_card.end, multiplyier: @work_card.multiplyier, start: @work_card.start }
    end

    assert_redirected_to work_card_path(assigns(:work_card))
  end

  test "should show work_card" do
    get :show, id: @work_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_card
    assert_response :success
  end

  test "should update work_card" do
    patch :update, id: @work_card, work_card: { end: @work_card.end, multiplyier: @work_card.multiplyier, start: @work_card.start }
    assert_redirected_to work_card_path(assigns(:work_card))
  end

  test "should destroy work_card" do
    assert_difference('WorkCard.count', -1) do
      delete :destroy, id: @work_card
    end

    assert_redirected_to work_cards_path
  end
end
