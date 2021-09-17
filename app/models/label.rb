class Label < ApplicationRecord
    has_many :tracks

    validates :name, uniqueness: true
end
