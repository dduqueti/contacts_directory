class PersonMailerWorker

  @queue = :default

  def self.perform(action, options = {})
    Person.all.each do |person|
      PersonMailer.send(action, person.id, options).deliver_now
    end
  end
end