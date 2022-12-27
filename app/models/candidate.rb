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
  enum :stage, %i[inbox screen interview decide offer hired archived], default: :inbox

  belongs_to :job

  validates :email, presence: true
end
