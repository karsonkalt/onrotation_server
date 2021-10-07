class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Class Methods
  def self.find_random
    self.name.constantize.find(rand(self.name.constantize.count) + 1)
  end

end
