class LeagueValidator < ActiveModel::Validator
  def validate(record)
    if League.find(record.league_id).full?
      record.errors[:base] << "Unable to join. League is full."
    end
  end
end
