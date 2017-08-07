require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      @user = User.create({first_name: "firstname",
      last_name: "lastname",
      email: "email@live.ca",
      password: "password",
      password_confirmation: "password"
      })
      @emptyuser = User.create
      @passwordvalidation = User.create({first_name: "firstname",
      last_name: "lastname",
      email: "email@live.ca",
      password: "pw",
      password_confirmation: "dpw"
      })
    end

    it "create a user" do
      expect(@user).to be_valid
    end

    it "should have a first_name" do
      expect(@emptyuser).not_to be_valid
      expect(@emptyuser.errors[:first_name]).to eql ["can't be blank"]
    end

    it "should have a last_name" do
      expect(@emptyuser).not_to be_valid
      expect(@emptyuser.errors[:last_name]).to eql ["can't be blank"]
    end

    it "should have an email" do
      expect(@emptyuser).not_to be_valid
      expect(@emptyuser.errors[:email]).to eql ["can't be blank"]
    end

    it "should have a password" do
      expect(@emptyuser).not_to be_valid
      expect(@emptyuser.errors[:password]).to eql ["can't be blank", "can't be blank",  "is too short (minimum is 5 characters)"]
    end

    it "should have a password_confirmation" do
      expect(@emptyuser).not_to be_valid
      expect(@emptyuser.errors[:password_confirmation]).to eql ["can't be blank"]
    end

    it "password and password_confirmation should be equal" do
      subject { build(:user, :password_confirmation => 'mismatch') }
      expect(@passwordvalidation).not_to be_valid
    end

    it "password should be longer than 5 characters" do
      expect(@passwordvalidation).not_to be_valid
      expect(@passwordvalidation.errors[:password]).to eql ["is too short (minimum is 5 characters)"]
    end
  end

  describe '.authenticate_with_credentials' do

    it "fails when email does not math db email" do
    User.create!(first_name: "Mere", last_name: "Mumby", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")
    email = "cash@gmail.com"
    password = "password"
    expect(User.authenticate_with_credentials(email, password)).to eql false
   end


    it "fails when password does not math db password" do
    User.create!(first_name: "Mere", last_name: "Mumby", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")
    email = "TEST1@TEST.com"
    password = "pswdd"
    expect(User.authenticate_with_credentials(email, password)).to eql false
   end

   it "works when email and password match db" do
    user = User.create!(first_name: "Mere", last_name: "Mumby", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")
    email = "TEST1@TEST.com"
    password = "password"
    expect(User.authenticate_with_credentials(email, password)).to eql user
   end

   it "works when email includes spaces" do
    user = User.create!(first_name: "Mere", last_name: "Mumby", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")
    email = "  TEST1@TEST.com"
    password = "password"
    expect(User.authenticate_with_credentials(email, password)).to eql user
   end

   it "works when email includes weird text" do
    user = User.create!(first_name: "Mere", last_name: "Mumby", email: "TEST1@TEST.com", password: "password", password_confirmation: "password")
    email = "Test1@TesT.cOm"
    password = "password"
    expect(User.authenticate_with_credentials(email, password)).to eql user
   end
  end

end

