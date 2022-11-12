class GenerateSlugToOldJob < ActiveRecord::Migration[7.0]
  def change
    Job.all.each(&:save)
  end
end
