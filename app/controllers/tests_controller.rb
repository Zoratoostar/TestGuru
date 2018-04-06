class TestsController < ApplicationController

  skip_before_action :authenticate_user!, only: :wrap
  before_action :find_test, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def wrap
    if user_signed_in?
      @tests = Test.all
      return render :index
    end

    @categories = Category.all
  end

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_evaluation(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
