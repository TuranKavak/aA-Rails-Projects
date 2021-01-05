require 'action_view'

class Cat < ApplicationRecord
    
    include ActionView::Helpers::DateHelper

    COLORS = %w(red blue black yellow white grey).freeze
    SEXES = %w(M F)
    
    validates :color, inclusion: COLORS
    validates :sex, inclusion: SEXES
    validates :birth_date, :color, :name, :sex, presence: true

    has_many :rental_requests, 
    class_name: :CatRentalRequest,
    dependent: :destroy

    def age
        time_ago_in_words(birth_date)
    end

end
