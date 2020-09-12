class Wicket < ApplicationRecord
  belongs_to :bowler, class_name: 'Player', optional: true
  belongs_to :batter, class_name: 'Player'
  belongs_to :caught_by, class_name: 'Player', optional: true
  belongs_to :run_out_by, class_name: 'Player', optional: true
  belongs_to :stumped_by, class_name: 'Player', optional: true
  belongs_to :inning
end
