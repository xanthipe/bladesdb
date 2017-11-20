module CharacterPointsAdjustmentTestHelper
  module_function # Ensure that all subsequent methods are available as Module Functions

  def add_character_point_adjustment(character, points, date = nil, approver = nil, approved: true)
    date = Date.today - 5.years if date.nil?
    approver = character.user if approver.nil?
    cpa = CharacterPointAdjustment.new
    cpa.character = character
    cpa.declared_on = date
    cpa.points = points
    cpa.reason = "Test"
    if !approved.nil?
      cpa.approved = approved
      cpa.approved_at = date
      cpa.approved_by = approver
    end
    cpa.save!
  end

end
