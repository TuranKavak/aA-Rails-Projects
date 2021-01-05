require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  # .freeze renders a constant immutable.
  CAT_COLORS = %w(black white orange brown).freeze

  validates :color, inclusion: CAT_COLORS, unless: -> { color.blank? }
  validates :sex, inclusion: %w(M F), if: -> { sex }
  validates :birth_date, :color, :name, :sex, :owner, presence: true
  validate :birth_date_in_the_past, if: -> { birth_date }


  belongs_to :owner,
  class_name: :User,
  foreign_key: :user_id



  # Remember, has_many is just a method where the first argument is
  # the name of the association, and the second argument is an options
  # hash.
  has_many :rental_requests,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end

  private

  def birth_date_in_the_past
    if birth_date && birth_date > Time.now
      errors[:birth_date] << 'must be in the past'
    end
  end
end
