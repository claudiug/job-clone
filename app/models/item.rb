# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  media_item :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Item < ActiveRecord::Base
  belongs_to :user
  validates :media_item, presence: true, length: {within: 10..200}
end
