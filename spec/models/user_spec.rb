require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      first_name: "Marcus",
      last_name: "Magnusson",
      email: "marmag@bredband2.se",
      password: "myPassword"
    )
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end


  it "is invalid without an email adress" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with duplicate email adress" do
    User.create(
      first_name: "Marcus",
      last_name: "Magnusson",
      email: "marmag@bredband2.se",
      password: "myPassword"
    )
    user = User.new(
      first_name: "Francis",
      last_name: "Marcus",
      email: "marmag@bredband2.se",
      password: "myPassword"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a users full name as a string" do
    user = User.new(
      first_name: "Marcus",
      last_name: "Magnusson",
      email: "marmag@bredband2.se",
      password: "myPassword"
    )
    expect(user.name).to eq "Marcus Magnusson"
  end
end
