class ContactForm < MailForm::Base
  attributes :name,  :validate => true
  attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message
  attributes :nickname,   :captcha => true
   def headers
    {
      :subject => "My Contact Form",
      :to => "meublagoevgrad@gmail.com",
      :from => %("#{name}" <#{email}>)
      #TODO put message body
    }
  end

end