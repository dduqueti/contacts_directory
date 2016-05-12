class PersonMailerWorker

  @queue = :default

  def self.perform(action, options = {})
    Person.pluck(:id).each do |person_id|
      PersonMailer.send(action, person_id, options).deliver_now
    end
  end
end