module MonsterPointsDeclarationTestHelper
  module_function # Ensure that all subsequent methods are available as Module Functions

  def create_pending_monster_point_declaration(user, points: 10, date: nil, reason: "Foo.")
    date = Date.today - 5.years if date.nil?
    MonsterPointDeclaration.create_with(points: points, declared_on: date).find_or_create_by!(user_id: user.id)
  end

  def create_approved_monster_point_declaration(user, approver, points: 10, date: nil, reason: "Foo.")
    mpd = create_pending_monster_point_declaration(user, points, date, reason)
    mpd.approvals.first.approve(approver)
  end

  def create_rejected_monster_point_declaration(user, approver, points: 10, date: nil, reason: "Foo.", rejection_reason: "Bar.")
    mpd = create_pending_monster_point_declaration(user, points, date, reason)
    mpd.approvals.first.reject(approver, rejection_reason)
  end

end
