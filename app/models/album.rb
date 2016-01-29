# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  recorded   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :title, :band_id, :recorded, presence: true
  validates :recorded, inclusion: { in: %w(live studio) }

  has_many :tracks, dependent: :destroy
  belongs_to :band
end
