require 'spec_helper'
describe User, :type => :model do
  
  before do
  @user = User.new(
    username: 'Adamchuk',
    email: 'oleksandr_a@ukr.net',
    password: '111111',
    password_confirmation: '111111'
    )
  end
  
   subject { @user }
  
  it 'should respond to attributes' do
    expect(@user).to respond_to(:username)
    expect(@user).to respond_to(:email)
    expect(@user).to respond_to(:password_digest)
    expect(@user).to respond_to(:password)
    expect(@user).to respond_to(:password_confirmation)
    expect(@user).to respond_to(:authenticate)
    
  end
    
  
  it 'is valid with a username, email and password_digest' do
    user = User.new(
      username: 'Adamchuk',
      email: 'oleksandr_a@ukr.net',
      password: '111111')
    expect(user).to be_valid
  end
  it 'is invalid without a username' do
    expect(User.new(username: nil).errors[:username]).to be_empty
  end
  
  it 'is invalid with email duplication ' do
    User.create(
      username: 'Jhon',
      email: 'jhon@ukr.net',
      password_digest: '111111')
    user = User.new(
      username: 'Jey',
      email: 'jhon@ukr.net',
      password_digest: '111111')
    expect(user.errors[:email]).to be_empty
  end
  
  it 'is invalid without a password_digest' do
     expect(User.new(password_digest: nil).errors[:password_digest]).to be_empty
  end
  describe "when password is not present" do
     before { @user.password = @user.password_confirmation = " " }
     it { should_not be_valid }
  end
  
  describe "with a password that's too short" do
  before { @user.password = @user.password_confirmation = "a" * 5 }
  it { should be_invalid }
  end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be false }
    end
  end
end


  