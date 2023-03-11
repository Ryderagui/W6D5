# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    CAT_COLORS = [
        "red",
        "black",
        "orange",
        "white"
    ]

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:date, "can't be in the future")
        end
    end

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: [ "M", "F" ] }
    validate :birth_date_cannot_be_future

    def age
        time_ago_in_words(birth_date)
    end

    has_many :cat_rental_requests, dependent: :destroy
end
