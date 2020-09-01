class SubmissionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.submission_mailer.received.subject
  #
  def submission(submission)
    @submission = submission

    mail to: @submission.user.email, subject: "Your film submission has been received!"
  end
end
