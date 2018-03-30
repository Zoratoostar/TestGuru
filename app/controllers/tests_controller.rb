class TestsController < ApplicationController

  skip_before_action :authenticate_user!, only: :wrap
  before_action :find_test, only: [:show, :edit, :update, :destroy, :start]
  # around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def wrap
    if logged_in?
      @tests = Test.all
      return render :index
    end

    @categories = Category.all
  end

  def index
    # render html: '<h1>All tests</h1>'.html_safe
    # render json: { tests: Test.all }
    # render inline: '<p>My favorite lang is: <%= %[ybuR].reverse %>!</p>'
    # render file: 'public/about', layout: false
    # head :no_content
    # render inline: '<%= console %>'

    # logger.info(self.object_id)

    # byebug

    # respond_to do |format|
    #   format.html { render plain: 'All tests' }
    #   format.json { render json: { tests: Test.all } }
    # end
    @tests = Test.all
  end

  def show; end

  def new
    # render file: 'app/views/tests/new.html.erb', layout: false
    @test = Test.new
  end

  def edit; end

  def create
    # render plain: "Parameters: #{params.inspect}"
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_evaluation(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start

    logger.info("Execution time: #{finish * 1000}ms; object_id: #{object_id}")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
