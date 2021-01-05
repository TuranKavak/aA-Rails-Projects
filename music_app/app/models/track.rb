class Track < ApplicationRecord

    belongs_to :album

    validates :title, :ord, :lyrics, presence: true
    validates :regular, inclusion: { in: [true, false] }
    validates :ord, uniqueness: { scope: :album_id }
    
    has_one :band, through: :album, source: :band 
    has_many :notes, dependent: :destroy
    after_initialize :set_defaults


    def set_defaults
      self.regular ||= true
    end

end
