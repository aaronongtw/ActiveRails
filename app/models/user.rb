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
end
