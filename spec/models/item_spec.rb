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

require 'rails_helper'

describe Item do

  it 'is valid with media_item' do
    expect(create(:item)).to be_valid
  end

  it 'is invalid with media_item' do
    i = build(:item, media_item: nil)
    i.valid?
    expect(i.errors[:media_item]).to include("can't be blank", "is too short (minimum is 10 characters)")
  end

  it 'is invalid with more than 200 chars' do
    i = build(:item, media_item: "f"*201)
    i.valid?
    expect(i.errors[:media_item]).to include("is too long (maximum is 200 characters)")
  end

  it 'is invalid with less than 10 chars' do
    i = build(:item, media_item: "a")
    i.valid?
    expect(i.errors[:media_item]).to include("is too short (minimum is 10 characters)")
  end

  it 'has default value for active true' do
    i = build(:item)
    expect(i.active).to eq true
  end

  describe '#just_active' do
    it 'return only the active items' do
      item = create(:item)
      item1 = create(:item, active: false)
      expect(Item.just_active.size).to eq 1
    end
  end
end
