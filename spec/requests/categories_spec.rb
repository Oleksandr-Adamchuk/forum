require 'spec_helper'

describe "Categories" do
  describe "Home_page" do
    it "should have the content 'Forum'" do
      visit categories_path
      expect(page).to have_content('Forum')
     end
  end
  describe "About" do
    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About')
     end
  end
end
