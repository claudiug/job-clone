# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  media_item :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  active     :boolean          default("t")
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    media_item "http://www.applift.com/about.html"
    active true
  end
end
