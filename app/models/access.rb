# == Schema Information
#
# Table name: accesses
#
#  created_at :datetime         not null
#  headers    :text
#  id         :integer          not null, primary key
#  payload    :text
#  updated_at :datetime         not null
#
# Indexes
#
#  index_accesses_on_created_at  (created_at)
#

class Access < ActiveRecord::Base
  attr_accessible :headers, :payload
end
