# Registration and Login

Then(/^the user should see a login access message$/) do
  HomePage.new.check_is_displaying_message I18n.t("devise.failure.unauthenticated")
end

Then(/^the user should see an unauthorised access message$/) do
  HomePage.new.check_is_displaying_message I18n.t("permissions.failure.permission_denied")
end

Then(/^the user should see an already signed in message$/) do
  HomePage.new.check_is_displaying_message I18n.t("devise.failure.already_authenticated")
end

Then(/^the user should see a suspended account message$/) do
  HomePage.new.check_is_displaying_message I18n.t("devise.failure.user.suspended")
end

Then(/^the user should see an inactive account message$/) do
  HomePage.new.check_is_displaying_message I18n.t("devise.failure.inactive")
end

Then(/^the user should see a successful login message$/) do
  HomePage.new.check_is_displaying_message I18n.t("devise.sessions.signed_in")
end

# User Profile Updates

Then(/^a profile updated message should be displayed$/) do
  ProfilePage.new.check_is_displaying_message I18n.t("success.user.own_profile_updated")
end

Then(/^an other user\'s profile updated message should be displayed$/) do
  sleep 0.1 # Just enough delay to keep things in sync
  ProfilePage.new.check_is_displaying_message I18n.t("success.user.other_profile_updated", name: User.all.second.name)
end

Then(/^a name already in use message should be displayed$/) do
  profile = ProfilePage.new
  profile.check_is_displaying_message I18n.t("validation.dialog_header", object: I18n.t("objects.user").downcase)
  profile.check_is_displaying_message I18n.t("validation.dialog_main", object: I18n.t("objects.user").downcase)
  profile.check_is_displaying_message I18n.t("validation.user.name_uniqueness")
end

Then(/^a login already in use message should be displayed$/) do
  profile = ProfilePage.new
  profile.check_is_displaying_message I18n.t("validation.dialog_header", object: I18n.t("objects.user").downcase)
  profile.check_is_displaying_message I18n.t("validation.dialog_main", object: I18n.t("objects.user").downcase)
  profile.check_is_displaying_message I18n.t("validation.username_uniqueness")
end

Then(/^an email already in use message should be displayed$/) do
  profile = ProfilePage.new
  profile.check_is_displaying_message I18n.t("validation.dialog_header", object: I18n.t("objects.user").downcase)
  profile.check_is_displaying_message I18n.t("validation.dialog_main", object: I18n.t("objects.user").downcase)
  profile.check_is_displaying_message I18n.t("user.validation.email_uniqueness")
end

Then(/^a successful password change message should be displayed$/) do
  ProfilePage.new.check_is_displaying_message I18n.t("devise.registrations.updated")
end

Then(/^a password mismatch message should be displayed$/) do
  RegistrationUpdatePage.new.check_is_displaying_message I18n.t("errors.messages.confirmation", attribute: "Password")
end

Then(/^an activation email message should be displayed$/) do
  MembersPage.new.check_is_displaying_message I18n.t("success.user.email_resent")
end

Then(/^a roles updated message should be displayed$/) do
  MembersPage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.roles"))
end

# Monster Point Declaration

Then(/^a monster point declaration made message should be displayed$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("success.created", object: I18n.t("objects.monster_point_declaration"))
end

Then(/^a negative monster point declaration not allowed message should be displayed$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("errors.messages.greater_than_or_equal_to", count: 0)
end

Then(/^a monster point declaration date must be in the past message should be displayed$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("errors.messages.on_or_before", restriction: Date.today.to_formatted_s)
end

Then(/^a monster point declaration updated message should be displayed$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.monster_point_declaration"))
end

# Monster Point Adjustment

Then(/^a monster point adjustment requested message should be displayed$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("success.created", object: I18n.t("objects.monster_point_adjustment"))
end

Then(/^a monster point adjustment date must be in the past message should be displayed$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("errors.messages.on_or_before", restriction: Date.today.to_formatted_s)
end

# Pages

Then(/^a home page cannot be deleted message should be displayed$/) do
  PagesPage.new.check_is_displaying_message I18n.t("failure.page.home_deletion")
end

Then(/^a page not available message should be displayed$/) do
  HomePage.new.check_is_displaying_message I18n.t("devise.failure.unauthenticated")
end

Then(/^a page deleted message should be displayed$/) do
  PagesPage.new.check_is_displaying_message I18n.t("success.deleted", object: I18n.t("objects.page"))
end

Then(/^a page updated message should be displayed$/) do
  UserDefinedPage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.page"))
end

Then(/^a page created message should be displayed$/) do
  UserDefinedPage.new.check_is_displaying_message I18n.t("success.created", object: I18n.t("objects.page"))
end

Then(/^a duplicate page title message is displayed$/) do
  UserDefinedPage.new.check_is_displaying_message I18n.t("validation.page.title_uniqueness")
end

Then(/^an empty page message is displayed$/) do
  UserDefinedPage.new.check_is_displaying_message I18n.t("errors.messages.blank", attribute: "Content")
end

# Character Declaration

Then(/^a character created message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("success.created", object: I18n.t("objects.character_declaration"))
end

Then(/^a character declared message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("success.created", object: I18n.t("objects.character_declaration"))
end

Then(/^a character must have a name message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.blank", attribute: "Name")
end

Then(/^a character must have death thresholds message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.blank", attribute: "Death thresholds")
end

Then(/^a character cannot have less than zero death thresholds message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.greater_than_or_equal_to", attribute: "Death thresholds", count: 0)
end

Then(/^a character cannot have more death thresholds than their race message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("validation.character_declaration.dts_greater_than_race")
end

Then(/^a death thresholds must be a number message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.not_a_number", attribute: "Death thresholds")
end

Then(/^a character must have character points message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.blank", attribute: "Death thresholds")
end

Then(/^a character cannot have less than (\d+) character points message should be displayed$/) do |rank|
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.greater_than_or_equal_to", attribute: "Character points", count: rank)
end

Then(/^a character points must be a number message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.not_a_number", attribute: "Character points")
end

Then(/^a character must have money message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.blank", attribute: "Starting florins")
end

Then(/^a character cannot have negative money message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.greater_than_or_equal_to", attribute: "Starting florins", count: 0)
end

Then(/^a money must be a number message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.not_a_number", attribute: "Starting florins")
end

Then(/^a character cannot have negative Guild starting points message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.greater_than_or_equal_to", attribute: "Character Point Total at which you joined your current guild", count: 0)
end

Then(/^a Guild starting points must be a number message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("errors.messages.not_a_number", attribute: "Character Point Total at which you joined your current guild")
end

Then(/^a Guild starting points must be less than character points message should be displayed$/) do
  UserCharactersPage.new.check_is_displaying_message I18n.t("failure.guild_membership.more_than_character_points")
end

# Character Profile Updates

Then(/^a character updated message should be displayed$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.character"))
end

# Guild Membership

Then(/^an application to join the Guild message should be displayed$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.guild_membership.joined", guild: Guild.find_by(name: "Test Guild"))
end

Then(/^an application to join the Guild and branch message should be displayed$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.guild_membership.joined_branch", guild: Guild.find_by(name: "Test Guild"), branch: Guild.find_by(name: "Branch 1"))
end

Then(/^an application to change to the Guild message should be displayed$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.guild_membership.changed", guild: Guild.find_by(name: "Test Guild 2"))
end

Then(/^an application to change to the Guild and branch message should be displayed$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.guild_membership.changed_branch", guild: Guild.find_by(name: "Test Guild 2"), branch: Guild.find_by(name: "Branch 1"))
end

Then(/^an application to change branch message should be displayed$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.guild_membership.changed_branch", guild: Guild.find_by(name: "Test Guild 2"), branch: Guild.find_by(name: "Branch 2"))
end

Then(/^an application to leave the Guild message should be displayed/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.guild_membership.left")
end

Then(/^an ejected from the guild message should be displayed/) do
  CharacterPage.new.check_is_displaying_message I18n.t("success.guild_membership.ejected")
end

# Approvals - MP Declaration

Then(/^a monster point declaration approved message should be displayed on the user's monster points page$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.monster_point_declaration"))
end

Then(/^a monster point declaration approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.monster_point_declaration"))
end

Then(/^a monster point declaration withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.monster_point_declaration"))
end

Then(/^a monster point declaration rejected message should be displayed on the user's monster points page$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.monster_point_declaration"))
end

Then(/^a monster point declaration rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.monster_point_declaration"))
end

# Approvals - MP Adjustment

Then(/^a monster point adjustment approved message should be displayed on the user's monster points page$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.monster_point_adjustment"))
end

Then(/^a monster point adjustment approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.monster_point_adjustment"))
end

Then(/^a monster point adjustment withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.monster_point_adjustment"))
end

Then(/^a monster point adjustment rejected message should be displayed on the user's monster points page$/) do
  MonsterPointsPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.monster_point_adjustment"))
end

Then(/^a monster point adjustment rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.monster_point_adjustment"))
end

# Approvals - Character Creation and Declaration

Then(/^a character creation request approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_declaration"))
end

Then(/^a character creation request approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_declaration"))
end

Then(/^a character declaration request approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_declaration"))
end

Then(/^a character declaration request approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_declaration"))
end

Then(/^a character declaration request withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.character_declaration"))
end

Then(/^a character creation request withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.character_declaration"))
end

Then(/^a character creation updated message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.character_declaration"))
end

Then(/^a character declaration updated message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.character_declaration"))
end

Then(/^a character creation request rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_declaration"))
end

Then(/^a character creation request rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_declaration"))
end

Then(/^a character declaration request rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_declaration"))
end

Then(/^a character declaration request rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_declaration"))
end

# Approvals - Recycle Character

Then(/^a recycle character request approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_recycling"))
end

Then(/^a recycle character request approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_recycling"))
end

Then(/^a recycle character request withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.character_recycling"))
end

Then(/^a recycle character request rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_recycling"))
end

Then(/^a recycle character request rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_recycling"))
end

# Approvals - Resurrect Character

Then(/^a resurrect character request approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_resurrection"))
end

Then(/^a resurrect character request approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_resurrection"))
end

Then(/^a resurrect character request withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.character_resurrection"))
end

Then(/^a resurrect character request rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_resurrection"))
end

Then(/^a resurrect character request rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_resurrection"))
end

# Approvals - Guild Membership

Then(/^a join Guild request approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request provisionally approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.provisionally_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request provisionally approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.provisionally_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request fully approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.fully_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request fully approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.fully_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request provisionally approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.provisionally_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request provisionally approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.provisionally_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request fully approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.fully_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request fully approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.fully_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a leave Guild request approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.fully_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a leave Guild request approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.fully_approved", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.guild_membership"))
end

Then(/^a leave Guild request withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.guild_membership"))
end

Then(/^a join Guild request rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.guild_membership"))
end

Then(/^a change Guild request rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.guild_membership"))
end

Then(/^a leave Guild request rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.guild_membership"))
end

Then(/^a leave Guild request rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.guild_membership"))
end

# Approvals - Character Point Adjustment

Then(/^a character point adjustment approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_point_adjustment"))
end

Then(/^a character point adjustment approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.character_point_adjustment"))
end

Then(/^a character point adjustment withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.character_point_adjustment"))
end

Then(/^a character point adjustment rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_point_adjustment"))
end

Then(/^a character point adjustment rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.character_point_adjustment"))
end

# Approvals - Death Threshold Adjustment

Then(/^a character death threshold adjustment approved message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.death_threshold_adjustment"))
end

Then(/^a character death threshold adjustment approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.death_threshold_adjustment"))
end

Then(/^a death threshold adjustment withdrawn message should be displayed$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.death_threshold_adjustment"))
end

Then(/^a character death threshold adjustment rejected message should be displayed on the character's profile page$/) do
  CharacterPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.death_threshold_adjustment"))
end

Then(/^a character death threshold adjustment rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.death_threshold_adjustment"))
end

# Approvals - Game Applications

Then(/^a game application approved message should be displayed on the game page$/) do
  GamePage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.game_application"))
end

Then(/^a game application approved message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.approved", object: I18n.t("objects.game_application"))
end

Then(/^a game application updated message should be displayed on the game page$/) do
  GamePage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.game_application"))
end

Then(/^a game application updated message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("success.updated", object: I18n.t("objects.game_application"))
end

Then(/^a game application withdrawn message should be displayed on the game page$/) do
  GamePage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.game_application"))
end

Then(/^a game application withdrawn message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.withdrawn", object: I18n.t("objects.game_application"))
end

Then(/^a game application rejected message should be displayed on the game page$/) do
  GamePage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.game_application"))
end

Then(/^a game application rejected message should be displayed on the dashboard$/) do
  DashboardPage.new.check_is_displaying_message I18n.t("approval.success.rejected", object: I18n.t("objects.game_application"))
end
