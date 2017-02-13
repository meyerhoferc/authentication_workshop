require 'rails_helper'

describe User do
  describe "validations" do
    it "is invalid without a name" do
      expect(User.new(email: "c", password: "123")).to be_invalid
    end

    it "is invalid without an email" do
      expect(User.new(name: "C", password: "123")).to be_invalid
    end

    it "is invalid without a password" do
      expect(User.new(name: "C", email: "c")).to be_invalid
    end
  end

  describe "uniqueness" do
    it "is invalid with a non-unique email" do
      User.create!(name: "C", email: "c", password: "123")
      expect(User.new(name: "D", email: "c", password: "p@ss")).to be_invalid
    end
  end

  describe ".authenticate" do
    it "returns nil or the user based on passowrd & email combination" do
      User.create!(name: "C", email: "c", password: "123")
      
      expect(User.authenticate("c", "123")).to eq(User.first)
      expect(User.authenticate("c", "1234")).to eq(nil)
    end
  end
end
