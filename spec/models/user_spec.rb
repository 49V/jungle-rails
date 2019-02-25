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
    
    # Create first user with beans@beans.com
    User.create(
      name: "Beans",
      email: "beans@beans.com",
      password: "catsrule",
      password_confirmation: "catsrule"
    )
    # Attempt to create second user with beans@beans.com    
    @user = User.create(
      name: "Beans",
      email: "beans@beans.com",
      password: "catsrule",
      password_confirmation: "catsrule"
    )
    expect(@user.id).to be_nil
  end

  it 'should not validate user with email exceeding 255 characters' do
    @user = User.create(
      name: "Beans",
      email: "test@test.com" * 20,
      password: "catsrule",
      password_confirmation: "catsrule"
    )
    expect(@user.id).to be_nil
  end

  it 'should not validate user without invalid email' do
    @user = User.create(
      name: "Beans",
      email: "This is not an email",
      password: "catsrule",
      password_confirmation: "catsrule"
    )
    expect(@user.id).to be_nil
  end

  it 'should not validate user without email' do
    @user = User.create(
      name: "Beans",
      password: "catsrule",
      password_confirmation: "catsrule"
    )
    expect(@user.id).to be_nil
  end

  it 'should not validate user without name' do
    @user = User.create(
      email: "beans@bean.com",
      password: "catsrule",
      password_confirmation: "catsrule"
    )
    expect(@user.id).to be_nil
  end

  it 'should not validate user with password length below minimum length' do
    @user = User.create(
      name: "Beans",
      email: "beans@bean.com",
      password: "cats",
      password_confirmation: "cats"
    )
    expect(@user.id).to be_nil
  end

end
