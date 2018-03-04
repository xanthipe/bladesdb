module DeathThresholAdjustmentTestHelper
  module_function # Ensure that all subsequent methods are available as Module Functions

  def add_death_threshold_adjustment(character, dts, date = nil, approver = nil, approved: true)
    date = Date.today - 5.years if date.nil?
    approver = character.user if approver.nil?
    dts = DeathThresholdAdjustment.new
    dts.character = character
    dts.declared_on = date
    dts.points = points
    dts.reason = "Test"
    if !approved.nil?
      dts.approved = approved
      dts.approved_at = date
      dts.approved_by = approver
    end
    dts.save!
  end

end
