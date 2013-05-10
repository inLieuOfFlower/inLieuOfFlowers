# == Schema Information
#
# Table name: donation_details
#
#  id              :integer          not null, primary key
#  donation_id     :integer
#  organization_id :integer
#  amount          :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class DonationDetail < ActiveRecord::Base
  attr_accessible :amount, :donation_id, :organization_id
end
