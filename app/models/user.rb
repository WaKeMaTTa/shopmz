class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_numericality_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :email
	validates_presence_of :password, :on => :create
	validates_length_of :password, :minimum => 8
	validates_format_of :password, :with => /[a-z0-9]{2,}/i
end
