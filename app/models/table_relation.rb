# == Schema Information
#
# Table name: table_relations
#
#  id           :integer          not null, primary key
#  table_id     :integer
#  relationship :string
#  through      :string
#  table_to     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TableRelation < ActiveRecord::Base
  belongs_to :table
end
