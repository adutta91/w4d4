class Note < ActiveRecord::Base
  validates :text, :title, :user_id, :track_id, presence: true

  belongs_to :user
  belongs_to :track

end
