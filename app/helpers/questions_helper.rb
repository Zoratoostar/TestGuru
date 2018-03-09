module QuestionsHelper

  def question_header(test_id)
    header = "#{Test.find(test_id).title} Question"
    reqfp = request.fullpath
    header = "Create New #{header}" if reqfp.include?('new')
    header = "Edit #{header}" if reqfp.include?('edit')
    header
  end

end
