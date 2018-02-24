class TestsController < ApplicationController

  before_action :find_test, only: :show
  around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    # render html: '<h1>All tests</h1>'.html_safe
    # render json: { tests: Test.all }
    # render inline: '<p>My favorite lang is: <%= %[ybuR].reverse %>!</p>'
    # render file: 'public/about', layout: false
    # head :no_content
    # byebug
    # render inline: '<%= console %>'

    # logger.info(self.object_id)

    # byebug

    # respond_to do |format|
    #   format.html { render plain: 'All tests' }
    #   format.json { render json: { tests: Test.all } }
    # end

    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")

  end

  def show
    render inline: '<%= @test.title %>'
  end

  def new
    # render file: 'app/views/tests/new.html.erb', layout: false
  end

  def create
    render plain: "Parameters: #{params.inspect}"
  end

  def search
    result = ["Class: #{params.class}", "Parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def log_execute_time
    start = Time.now
    yield
    finish = Time.now - start

    logger.info("Execution time: #{finish * 1000}ms")
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end
