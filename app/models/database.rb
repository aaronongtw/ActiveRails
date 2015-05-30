# == Schema Information
#
# Table name: databases
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tablenum   :integer
#  user_id    :integer
#

class Database < ActiveRecord::Base
  has_many :tables
  belongs_to :user
end
