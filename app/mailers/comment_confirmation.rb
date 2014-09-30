class CommentConfirmation < ActionMailer::Base
  default from: "from@example.com"

  def notification(comment, reviewer)
    @comment = comment
    @reviewer = reviewer

    mail to: @reviewer.email,
      subject: "Your review was commented on."
  end
end

#{comment_body.review.title}
