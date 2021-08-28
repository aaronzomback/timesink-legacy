# Preview all emails at http://localhost:3000/rails/mailers/new_member_mailer
class NewMemberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_member_mailer/greeting
  def greeting
    NewMemberMailer.greeting
  end

end
