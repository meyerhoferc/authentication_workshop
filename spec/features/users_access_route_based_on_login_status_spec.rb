require 'rails_helper'

feature "authorize users" do
  context "when they are logged in" do
    it "allows them access to a secret route" do
      User.create!(name: "Courtney", email: "anon@anon", password: "123")

      visit login_path

      fill_in("session[email]", with: "anon@anon")
      fill_in("session[password]", with: "123")
      click_on("Log In")

      visit secret_path
      expect(current_path).to eq(secret_path)
      within("h1") do
        expect(page).to have_content("Welcome to the super secret site")
      end
    end

    context "when they are not logged in" do
      it "redirects them to the login page" do
        User.create!(name: "Courtney", email: "anon@anon", password: "123")

        visit secret_path
        expect(current_path).to eq(login_path)
      end
    end
  end
end
