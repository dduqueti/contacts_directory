class PersonMailer < ApplicationMailer
  def person_created(user_id, first_name, last_name, created_id)
    @person = Person.find user_id
    @first_name = first_name
    @last_name = last_name
    @created_id = created_id
    mail(to: @person.email, subject: 'Contacts Directory - New Contact Added')
  end

  def person_deleted(user_id, first_name, last_name)
    @person = Person.find user_id
    @first_name = first_name
    @last_name = last_name
    mail(to: @person.email, subject: 'Contacts Directory - Contact recently deleted')
  end
end