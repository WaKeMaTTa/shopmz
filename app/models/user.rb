class User < ActiveRecord::Base
	has_secure_password

	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
	validates :password, presence: true, on: :create
	validates :password, length: { minimum: 8 }, format: { :with => /\A[a-z0-9]{2,}\Z/i }
end
