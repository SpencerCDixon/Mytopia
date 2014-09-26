class CommentConfirmation < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_confirmation.notification.subject
  #
  def notification(comment, reviewer)
    @comment = comment
    @reviewer = reviewer

    mail to: @reviewer.email,
      subject: "Your review was commented on."
  end
end

#{comment_body.review.title}
