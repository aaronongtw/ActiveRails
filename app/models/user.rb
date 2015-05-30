# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#

class User < ActiveRecord::Base
  has_many :databases
    ##ADDING SECURITY##
  has_secure_password

  ##NEEDS A NAME##
  validates :email, :presence => true

  ##useremail is case sensitive
  validates :email, :uniqueness => true

  ##username of length of 6
  validates :password, length: { in: 6..20 }
end
