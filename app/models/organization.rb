# == Schema Information
#
# Table name: organizations
#
#  id                  :integer          not null, primary key
#  name                :string(255)      not null
#  street              :string(255)      not null
#  city                :string(255)      not null
#  state               :string(255)      not null
#  zip                 :string(255)      not null
#  phone               :string(255)      not null
#  email               :string(255)      not null
#  contact_name        :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  status              :string(255)      default("pending"), not null
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#

class Organization < ActiveRecord::Base
  attr_accessible :city, :contact_name, :email, :name, :phone, :state,
    :street, :zip, :status, :avatar

  has_attached_file :avatar, :styles => { :medium => "300x300>", 
    :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :city, presence: true
  validates :contact_name, presence: true
  validates :name, presence: true
  validates :phone, presence: true, length: { maximum: 13 }
  validates :state, presence: true, length: { maximum: 2 }
  validates :street, presence: true
  validates :zip, presence: true
  validates :status, presence: true 
end
