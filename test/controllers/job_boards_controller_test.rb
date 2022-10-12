require "test_helper"

class JobBoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_board = job_boards(:one)
  end

  test "should get index" do
    get job_boards_url, as: :json
    assert_response :success
  end

  test "should create job_board" do
    assert_difference("JobBoard.count") do
      post job_boards_url, params: { job_board: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show job_board" do
    get job_board_url(@job_board), as: :json
    assert_response :success
  end

  test "should update job_board" do
    patch job_board_url(@job_board), params: { job_board: {  } }, as: :json
    assert_response :success
  end

  test "should destroy job_board" do
    assert_difference("JobBoard.count", -1) do
      delete job_board_url(@job_board), as: :json
    end

    assert_response :no_content
  end
end
