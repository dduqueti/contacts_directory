json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture
  json.url person_url(person, format: :json)
end
