# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(254)
#  job        :string(255)
#  bio        :text(65535)
#  gender     :string(1)
#  birthdate  :date
#  picture    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    job { Faker::Company.profession }
    bio { Faker::Company.bs }
    gender "M"
    birthdate { Faker::Date.between(60.years.ago, 20.years.ago) }
    picture { Faker::Internet.url }
  end
end
