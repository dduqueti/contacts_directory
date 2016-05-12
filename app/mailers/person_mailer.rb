class PersonMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def person_created(user_id, options = {})
    @recipient = Person.find user_id
    @created_person = Person.find options['created_id']
    @url = person_url(@created_person)
    mail(to: @recipient.email, subject: 'Contacts Directory - New Contact Added')
  end

  def person_deleted(user_id, options = {})
    @recipient = Person.find user_id
    @managed_full_name = options['managed_full_name']
    @url = people_url
    mail(to: @recipient.email, subject: 'Contacts Directory - Contact recently deleted')
  end
end