require 'rails_helper'

feature "user goes to /users/new" do
  it "they submit a form" do
    visit new_user_path

    expect(User.count).to eq(0)

    fill_in("user[name]", with: "Courtney")
    fill_in("user[email]", with: "anon@anon")
    fill_in("user[password]", with: "123456")
    click_on("Create")

    expect(User.count).to eq(1)
    expect(current_path).to eq(user_path(User.first))
  end
end
