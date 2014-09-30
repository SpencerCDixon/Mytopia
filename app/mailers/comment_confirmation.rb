class CommentConfirmation < ActionMailer::Base
  default from: "from@example.com"

  # def welcome_email(user)
  #   @user = user
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

  def notification(comment, reviewer)
    @comment = comment
    @reviewer = reviewer

    mail to: @reviewer.email,
      subject: "Your review was commented on."
  end
end

#{comment_body.review.title}
