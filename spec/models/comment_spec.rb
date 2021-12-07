require "rails_helper"

describe Comment, type: :model do
  describe "validations" do
    it {should belont_to(:article)}
  end
end