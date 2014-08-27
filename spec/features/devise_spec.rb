require 'rails_helper'

feature "signing in" do
  background do
    FactoryGirl.create(:user, email: "foo@foo.com", password: "secret1234")
  end

  scenario "signing in with correct credentials" do
    visit "/users/sign_in"
    within("#new_user") do
      fill_in "Email", with: "foo@foo.com"
      fill_in "Password", with: "secret1234"
    end
    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
  end
end
