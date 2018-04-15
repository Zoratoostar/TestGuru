class TestsController < ApplicationController

  skip_before_action :authenticate_user!, only: :entry
  before_action :find_test, only: :start

  def entry
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
end
