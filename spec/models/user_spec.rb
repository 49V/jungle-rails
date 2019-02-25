require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should validate user with valid fields and matching passwords' do
    @user = User.create(
      name: "Beans",
      email: "beans@bean.com",
      password: "catsrule",
      password_confirmation: "catsrule"
    )
    expect(@user.id).to be_present
  end

  it 'should not valid user with mismatched passwords' do
    @user = User.create(
      name: "Beans",
      email: "beans@bean.com",
      password: "catsrule",
      password_confirmation: "catsdrool"
    )
    expect(@user.id).to be_nil
  end

  it 'should not validate user with existing email' do
    
  end

  it 'should not validate user without email' do

  end

  it 'should not validate user without first name' do

  end

  it 'should not validate user without last name' do

  end

end
