require 'rails_helper'

feature "user can log in" do
  context "with valid credentials" do
    it "stores user info in sessions" do
      User.create!(name: "Courtney", email: "anon@anon", password: "123")

      visit login_path

      fill_in("session[email]", with: "anon@anon")
      fill_in("session[password]", with: "123")
      click_on("Log In")

      expect(current_path).to eq(user_path(User.first))
      within(".success") do
        expect(page).to have_content("Log-in Successful!")
      end
    end
  end

  context "with invalid credentials" do
    it "re-renders the login page" do
      User.create!(name: "Courtney", email: "anon@anon", password: "123")

      visit login_path

      fill_in("session[email]", with: "anon@anon")
      fill_in("session[password]", with: "123456")
      click_on("Log In")

      expect(current_path).to eq(login_path)
      within(".error") do
        expect(page).to have_content("Invalid credentials. Log in again!")
      end
    end
  end
end
