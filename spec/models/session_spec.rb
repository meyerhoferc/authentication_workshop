require 'rails_helper'

RSpec.describe Session, type: :model do
  describe "validations" do
    it "is invalid without an email" do
      expect(Session.new(password: "123")).to be_invalid
    end

    it "is invalid without a password" do
      expect(Session.new(email: "anon")).to be_invalid
    end
  end
end
