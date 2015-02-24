# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :items
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true,
            length: {maximum: 100},
            format: {with: EMAIL_FORMAT},
            uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 5}

  before_save do
    self.email = email.downcase
  end

end
