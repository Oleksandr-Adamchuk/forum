require 'spec_helper'


describe User, :type => :model do
  it 'is valid with a username, email and password' do
    user = User.new(
      username: 'Adamchuk',
      email: 'oleksandr_a@ukr.net',
      password: '1111')
    expect(user).to be_valid
  end
  it 'is invalid without a username' do
    expect(User.new(username: nil).errors[:username]).to be_empty
  end
  
  it 'is invalid without a email' do
    User.create(
      username: 'Jhon',
      email: 'jhon@ukr.net',
      password: '1111')
    user = User.new(
      username: 'Jey',
      email: 'jhon@ukr.net',
      password: '1111')
    expect(user.errors[:email]).to be_empty
  end
  
  it 'is invalid without a password' do
     expect(User.new(password: nil).errors[:password]).to be_empty
  end
end
  