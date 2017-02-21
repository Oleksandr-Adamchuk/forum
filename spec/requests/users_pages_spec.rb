require 'spec_helper'

describe 'User pages' do
   
  subject { page }
  describe 'profile page' do
    let(:user) {FactoryGirl.create(:user)}
    before { visit user_path(user) }
    it { expect(page).to have_content(user.username) }
    it { expect(page).to have_title(user.username) }
  end
  
  describe 'signup page' do
    before {visit signup_path  }
    
    # page.has_content? Sign up
    it { expect(page).to  have_content 'Sign up' }
    
    it { expect(page).to have_title 'Sign up' }
    #save_and_open_page
    #page.save_screenshot('screenshot.png')
    let(:submit) { "Create my account" }
    
    describe 'With invalid information' do
      it 'Should not create user' do
        expect { click_button submit }.not_to change(User, :count)    
      end
    end  
    
    describe "with valid information" do
      before do
        fill_in "user_username", with: "Mandaryn"
        fill_in "user_email", with: "mandaryn@ukr.net"
        fill_in "user_password", with: "orange1"
        fill_in "user_password_confirmation", with: "orange1"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
    
  
  end
end