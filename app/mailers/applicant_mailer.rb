class ApplicantMailer < ActionMailer::Base
  default from: 'meublagoevgrad@gmail.com'
  def acceptance_mail(application)
    @application = application
    @url = 'http://www.meu-blagoevgrad.eu'
    mail(to: @application.email , subject: 'Congratulations! You have been accepted!')
  end
end
