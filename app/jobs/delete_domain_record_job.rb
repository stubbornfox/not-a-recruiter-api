class DeleteDomainRecordJob < ApplicationJob
  queue_as :default

  def perform(cname)
    DomainRecordDelete.call(cname)
  end
end
