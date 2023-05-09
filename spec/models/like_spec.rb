require "rails_helper"

RSpec.describe Like do
  describe "#increase_counter!" do
    it "increases the likes counter" do
      like = create(:like)

      expect {
        like.increase_counter!
      }.to change { like.counter }.from(1).to(2)
    end
  end
end
