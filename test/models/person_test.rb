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

require 'test_helper'

class PersonTest < ActiveSupport::TestCase

	let(:person) { FactoryGirl.create(:person, first_name: "Yoshitomo", last_name: "Whiskicito") }

  it 'creates from factory' do
    person.must_be_instance_of Person
  end

  it "does not creates with nil first_name" do
    person = FactoryGirl.build(:person, first_name: nil)
    person.invalid?(:first_name).must_equal true
    person.errors[:first_name].must_equal ["can't be blank"]
  end

  it "does not creates with invalid first_name" do
    person = FactoryGirl.build(:person, first_name: Faker::Lorem.paragraph(5))
    person.invalid?(:first_name).must_equal true
    person.errors[:first_name].must_equal ["is too long (maximum is 75 characters)"]
  end

  it "does not creates with nil last_name" do
    person = FactoryGirl.build(:person, last_name: nil)
    person.invalid?(:last_name).must_equal true
    person.errors[:last_name].must_equal ["can't be blank"]
  end

  it "does not creates with invalid first_name" do
    person = FactoryGirl.build(:person, last_name: Faker::Lorem.paragraph(5))
    person.invalid?(:last_name).must_equal true
    person.errors[:last_name].must_equal ["is too long (maximum is 75 characters)"]
  end

  it "does not creates with nil birthdate" do
    person = FactoryGirl.build(:person, birthdate: nil)
    person.invalid?(:birthdate).must_equal true
    person.errors[:birthdate].must_equal ["can't be blank"]
  end

  it "does not creates with future birthdate" do
    person = FactoryGirl.build(:person, birthdate: Time.now + 1.year)
    person.invalid?(:birthdate).must_equal true
    person.errors[:birthdate].must_equal ["can't be in the future"]
  end

  it "does not creates with nil bio" do
    person = FactoryGirl.build(:person, bio: nil)
    person.invalid?(:bio).must_equal true
    person.errors[:bio].must_equal ["can't be blank"]
  end

  it "does not creates with nil email" do
    person = FactoryGirl.build(:person, email: nil)
    person.invalid?(:email).must_equal true
    person.errors[:email].must_equal ["can't be blank", "is not an email"]
  end

  it "does not creates with invalid email" do
    person = FactoryGirl.build(:person, email: "any.given/email")
    person.invalid?(:email).must_equal true
    person.errors[:email].must_equal ["is not an email"]
  end

  it "does not creates with duplicated email" do
  	FactoryGirl.create(:person, email: 'danieljduque@gmail.com')
    person = FactoryGirl.build(:person, email: "danieljduque@gmail.com")
    person.invalid?(:email).must_equal true
    person.errors[:email].must_equal ["has already been taken"]
  end

  it "does not creates with invalid picture url" do
    person = FactoryGirl.build(:person, picture: "any#given-url")
    person.invalid?(:picture).must_equal true
    person.errors[:picture].must_equal ["is not a valid URL"]
  end

  it "delivers full name" do
  	person.full_name.must_equal "Yoshitomo Whiskicito"
  end

  it "delivers expected age" do
  	person.update(birthdate: Time.now - 20.year)
  	person.age.must_equal 20
  end

  it "delivers expected ordered list" do
  	julian = FactoryGirl.create(:person, first_name: "Julian", last_name: "Tirado")
  	daniel = FactoryGirl.create(:person, first_name: "Daniel", last_name: "Duque")
  	people = Person.list
  	people.first.must_equal daniel
  	people.count.must_equal 3
  end
end
