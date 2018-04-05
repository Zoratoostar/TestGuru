class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :edit, :update, :destroy]
  # around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    # render html: '<h1>All tests</h1>'.html_safe
    # render json: { tests: Test.all }
    # render inline: '<p>My favorite lang is: <%= %[ybuR].reverse %>!</p>'
    # render file: 'public/about', layout: false
    # head :no_content
    # render inline: '<%= console %>'

    # logger.info(self.object_id)

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
    @test = Test.new(test_params)
    @test.user_id = current_user.id
    if @test.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
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
