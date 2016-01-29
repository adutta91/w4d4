# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  style      :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :title, :album_id, :style, presence: true
  validates :style, inclusion: { in: %w(bonus regular)}

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band
end
