# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  name        :string
#  database_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Relationship < ActiveRecord::Base
  has_and_belongs_to_many :tables
end
