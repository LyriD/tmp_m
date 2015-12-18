class FeedbackMailer < ApplicationMailer
  def send_notification(feedback)
    email = feedback.service.user.email
    @feedback = feedback
    attachments[@feedback.file_file_name] = File.read(@feedback.file.path) if @feedback.file.present?
    mail to: email
  end
end
