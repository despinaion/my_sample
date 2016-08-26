class UserMailer < ApplicationMailer
	default from: "unidepth86@gmail.com"

  def contact_form(email, name, message)
  	@message = message
    mail(:from => email,
        :to => 'unidepth@hotmail.com',
        :subject => "A new contact form message from #{name}")
  end

end
