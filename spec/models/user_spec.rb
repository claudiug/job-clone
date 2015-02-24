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

require 'rails_helper'

describe User do

  it 'is valid with name, email and password' do
    u = build(:user)
    u.valid?
    expect(u).to be_valid
  end

  it 'is invalid with name' do
    u = build(:user, name: nil)
    u.valid?
    expect(u.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a name bigger than 30 chars" do
    u = build(:user, name: "a"* 31)
    u.valid?
    expect(u.errors[:name]).to include("is too long (maximum is 30 characters)")
  end

  it 'is invalid with email' do
    u = build(:user, email: nil)
    u.valid?
    expect(u.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with no proper email format' do
    u = build(:user, email: "foo@foo")
    u.valid?
    expect(u.errors[:email]).to include("is invalid")
  end

  it 'is invalid with duplicate email address' do
    create(:user, email: "email@example.net")
    u = build(:user, email: "email@example.net")
    u.valid?
    expect(u.errors[:email]).to include("has already been taken")
  end

  it 'is invalid with less than 5 char for the password' do
    u = build(:user, password: "foo")
    u.valid?
    expect(u.errors[:password]).to include("is too short (minimum is 5 characters)")
  end
end
