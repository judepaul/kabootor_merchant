class ContactMailer < ApplicationMailer
  default from: 'support@kabootor.com', to: 'jude@seedcube.com'
    
  def send_contact_info(contact)
    @contact = contact
    mail(to: "jude@seedcube.com", subject: 'Kabootor - A person has contacted you..!')
  end
  
end
