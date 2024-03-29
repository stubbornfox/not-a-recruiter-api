# == Schema Information
#
# Table name: candidates
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  headline   :text
#  last_name  :string
#  location   :string
#  name       :string
#  notes      :text
#  phone      :string
#  score      :float            default(0.0)
#  stage      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  job_id     :bigint
#
# Indexes
#
#  index_candidates_on_job_id  (job_id)
#
class Candidate < ApplicationRecord
  has_one_attached :resume
  enum :stage, %i[review shortlisted interview hired declined], default: :review

  include PgSearch::Model
  pg_search_scope :search_any_word,
                  against: %i[name first_name last_name],
                  using: {
                    tsearch: { any_word: true }
                  }

  belongs_to :job

  validates :email, presence: true
  validates :name, presence: true
  # validates :resume, attached: true, size: { less_than_or_equal_to: 5.megabytes , message: 'is too large' }, content_type: %i[docx pdf]

  after_create_commit :notify_new_applicantion

  private

  def notify_new_applicantion
    NewApplicationJob.perform_later(self.id)
    NewApplicantNotification.with(candidate_id: self.id, job_id: self.job_id).deliver(self.job.user)
  end
end
