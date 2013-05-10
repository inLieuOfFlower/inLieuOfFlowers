# == Schema Information
#
# Table name: honored_organizations
#
#  id              :integer          not null, primary key
#  honored_id      :integer
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class HonoredOrganization < ActiveRecord::Base
  attr_accessible :honored_id, :organization_id
end
