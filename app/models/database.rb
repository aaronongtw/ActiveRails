# == Schema Information
#
# Table name: databases
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  Tablenum   :integer
#

class Database < ActiveRecord::Base
  has_many :tables
end
