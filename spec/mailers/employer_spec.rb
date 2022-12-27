require "rails_helper"

RSpec.describe EmployerMailer, type: :mailer do
  describe "new_applicant" do
    let(:mail) { EmployerMailer.new_applicant }

    it "renders the headers" do
      expect(mail.subject).to eq("New applicant")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
