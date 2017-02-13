require 'rails_helper'

feature "user can log out" do
  context "when a user visits /logout" do
    it "displays a message that they've logged out" do
      User.create!(name: "Courtney", email: "anon@anon", password: "123")

      visit login_path

      fill_in("session[email]", with: "anon@anon")
      fill_in("session[password]", with: "123")
      click_on("Log In")

      visit logout_path

      within(".status") do
        expect(page).to have_content("Successfully logged out")
      end
    end
  end
end
