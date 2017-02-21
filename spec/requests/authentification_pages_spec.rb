require 'spec_helper'

describe 'Authentification' do
  subject { page }
  
  describe 'signin page' do
    before { visit signin_path }
    
    it {expect(page).to have_content('Sign in')}
    it {expect(page).to have_title('Sign in')}
  end
  
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { expext(page).to have_title('Sign in') }
      it { should have_selector('div.alert.alert-error') }
    end
  
    describe 'With valis information' do
      let(:user) {FactoryGirl.create(:user)}
      before do
        fill_in 'user_username', with: user.email.upcase
        fill_in 'user_password', with: user.password
        click_button 'Sign in'
      end
      
      it { expect(page).to have_title(user.username)  }
      it { expect(page).to have_link('Profile', href: user_path(user))  }
      it { expect(page).to have_link('Sign out', href: signout_path)  }
      it { expect(page).to_not have_link('Sign out', href: signout_path)  }
    end
  end
  
  
end