class TestEvaluation < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_create :before_create_set_started_at

  def accept!(answer_option_ids)
    self.correct_answers += 1 if correct_answer?(answer_option_ids)
    if self.current_question = next_question
      self.question_number += 1
    else
      self.percent = 100 * correct_answers / question_number
      self.finished_at = Time.current
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
    self.question_number = 1
  end

  def before_create_set_started_at
    self.started_at = created_at
  end

  def correct_answer?(answer_option_ids)
    # correct_options_count = correct_options.count
    # return true if answer_option_ids.nil? && correct_options_count.zero?
    # (correct_options_count == correct_options.where(id: answer_option_ids).count) &&
    # correct_options_count == answer_option_ids.count
    return true if answer_option_ids.nil? && correct_options.count.zero?
    current_question.answer_options.right_options.ids.sort == answer_option_ids.map(&:to_i).sort
  end

  def correct_options
    current_question.answer_options.right_options
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question_id).first
  end
end
