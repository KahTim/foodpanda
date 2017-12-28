require 'rails_helper'

RSpec.describe 'Todo', type: :feature do

	feature "User sign up" do
	    scenario "Text fields are filled up" do
	      
	      visit new_user_path
	      within("#name") do
	        fill_in "Name", with: "Test"
	      end
	      within("#email") do
	        fill_in "Email", with: "1@gmail.com"
	      end
	      within("#pass") do
	        fill_in "Password", with: "1"
	      end
	      # click_button "New Task"
	      # expect(page).to have_selector(:link_or_button, 'Complete')
	      # click_button "Complete"
	      # expect(page).to have_content 'True'
	      click_button "Sign Up"
	      expect(page).to have_content "Successful!"
	    end

	end

end 