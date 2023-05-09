class Like < ApplicationRecord
  def increase_counter!
    self.counter = self.counter + 1
    save!
  end
end
