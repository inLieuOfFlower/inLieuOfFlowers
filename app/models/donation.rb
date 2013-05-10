# == Schema Information
#
# Table name: donations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  honored_id :integer
#

class Donation < ActiveRecord::Base
  attr_accessible :user_id, :honored_id
end
