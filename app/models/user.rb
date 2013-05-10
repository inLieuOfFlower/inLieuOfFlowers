# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  street                 :string(255)      not null
#  city                   :string(255)      not null
#  state                  :string(255)      not null
#  zip                    :string(255)      not null
#  phone                  :string(255)      not null
#  administrator          :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  	:first_name, :last_name, :street, :city, :state, :zip, :phone, :administrator
  # attr_accessible :title, :body

  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  	uniqueness: {case_sensitive: false}
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { maximum: 2 }
  validates :zip, presence: true
  validates :phone, presence: true, length: { maximum: 13 }
end
