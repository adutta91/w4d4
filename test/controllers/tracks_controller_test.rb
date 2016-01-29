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

require 'test_helper'

class TracksControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
