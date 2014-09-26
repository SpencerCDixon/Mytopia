require "rails_helper"

RSpec.describe CommentConfirmation, :type => :mailer do
  describe "notification" do
    let(:comment) { FactoryGirl.create(:comment) }
    let(:mail) { CommentConfirmation.notification(comment, comment.review.user ) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your review was commented on.")
      expect(mail.to).to eq([comment.review.user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(comment.body)
    end
  end

end
