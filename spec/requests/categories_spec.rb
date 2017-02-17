require 'spec_helper'

describe "Categories" do
  describe "Home_page" do
    it "should have the content 'Forum'" do
      visit '/categories'
      expect(page).to have_content('Forum')
     end
  end
  describe "Aboit" do
    it "should have the content 'About'" do
      visit '/about'
      expect(page).to have_content('About')
     end
  end
end
