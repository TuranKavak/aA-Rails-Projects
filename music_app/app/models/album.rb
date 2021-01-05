class Album < ApplicationRecord

  belongs_to :band
  has_many :tracks, dependent: :destroy

  validates :band, :title, :year, presence: true
  validates :live, inclusion: { in: [true, false] }  # can't use presence validation with boolean field
  validates :title, uniqueness: { scope: :band_id }
  validates :year, numericality: { minimum: 1900, maximum: 9000 }

  after_initialize :set_defaults

  def set_defaults
    self.live ||= false
  end

end
