# == Schema Information
#
# Table name: tables
#
#  id          :integer          not null, primary key
#  name        :string
#  database_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  fieldnum    :integer
#

class Table < ActiveRecord::Base
  has_many :fields
  has_and_belongs_to_many :relationships
  belongs_to :database
end
