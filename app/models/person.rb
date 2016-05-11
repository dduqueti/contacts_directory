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

require 'uri'

class Person < ActiveRecord::Base

	# Constants

	GENDER = %w(M F)

	# Validations

	validates :first_name, presence: true, length: { maximum: 75 }
	validates :last_name, presence: true,  length: { maximum: 75 }
	validates :birthdate, presence: true
	validates :bio, presence: true
	validates :job, length: { maximum: 75 }
	validates :gender, inclusion: { in: GENDER }
	validates :email, presence: true,
										uniqueness: true,
										length: { maximum: 254 },
										email: true
	validate :valid_picture_url, :dob_not_in_future

	# Class methods

	def self.list
		Person.all
	end

	# Instance methods

	def display_name
		"#{first_name} #{last_name}"
	end

	def age

	end

	private

	# Custom validation methods

	def valid_picture_url
	  uri = URI.parse(picture)
	  uri.kind_of?(URI::HTTP)
	rescue URI::InvalidURIError
		errors.add(:picture, "must have a valid URL")
	end

	 def dob_not_in_future
    if birthdate.present? && birthdate > Date.today
      errors.add(:birthdate, "can't be in the future")
    end
  end
end
