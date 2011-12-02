# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
  default :from => "nuit2011.ogc@gmail.com"
 
  def send_email(email, victim, event_id)
    @victim = victim
    @event_id = event_id
    @url  = "http://example.com/login"
    mail(:to => email,
         :subject => "Cadeau pour #{victim}") do |format|
      format.html { render 'send_mail' }
      # format.text { render :text => "Salut ! J'organise de faire un cadeau à #{victim} ! Ca te tente de venir participer avec moi ?\n
      #                               Si ça te tente viens t'inscrire à #{link_to "l'évènement", event_url(event_id)}.".to_html }
    end    
  end
 
end