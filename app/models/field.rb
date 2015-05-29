# == Schema Information
#
# Table name: fields
#
#  id         :integer          not null, primary key
#  name       :string
#  fieldtype  :string
#  table_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Field < ActiveRecord::Base
  belongs_to :table
end
