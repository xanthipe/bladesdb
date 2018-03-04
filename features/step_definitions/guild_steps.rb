# Set-up

Given(/^the Guild has branches$/) do
  GuildTestHelper.create_guild_branch
end

Given(/^the Guild has another branch$/) do
  GuildTestHelper.create_guild_branch(name: "Branch 2")
end

Given(/^the character is a member of the last branch of the Guild$/) do
  GuildTestHelper.join_guild_approved(Character.first, Guild.find_by(name: "Test Guild"), GuildBranch.last)
end

Given(/^there is a Guild$/) do
  GuildTestHelper.create_guild
end

Given(/^there is another Guild$/) do
  GuildTestHelper.create_guild(name: "Test Guild 2")
end

Given(/^the other Guild has branches$/) do
  GuildTestHelper.create_guild_branch(guild: Guild.find_by(name: "Test Guild 2"))
end

Given(/^the character is a member of the Guild$/) do
  GuildTestHelper.join_guild_approved(Character.first, Guild.find_by(name: "Test Guild"))
end

Given(/^the character is Guildless$/) do
  GuildTestHelper.join_guild_approved(Character.first, nil)
end

Given(/^the character joined the Guild at rank (.*?)$/) do |rank|
  unless rank.to_i == 0
    CharacterTestHelper.update_starting_rank(Character.first, rank.to_i*10)
    GuildTestHelper.update_start_rank(rank.to_i*10)
  end
end

Given(/^the character has an application to join the Guild$/) do
  GuildTestHelper.join_guild_pending(Character.first, Guild.find_by(name: "Test Guild"), approved: nil)
end

Given(/^the character has an application to join another Guild$/) do
  GuildTestHelper.join_guild_pending(Character.first, Guild.find_by(name: "Test Guild 2"), approved: nil)
end

Given(/^the character has an application to leave the Guild$/) do
  GuildTestHelper.leave_guild_pending(Character.first, approved: nil)
end

# Actions

When(/^the character asks to join the Guild$/) do
  CharacterPage.new.visit_page(character_path(1)).and.join_guild("Test Guild")
end

When(/^the character asks to join the last branch of the Guild$/) do
  CharacterPage.new.visit_page(character_path(1)).and.join_guild("Test Guild", branch: "Branch 1")
end

When(/^the character asks to join the other Guild$/) do
  CharacterPage.new.visit_page(character_path(1)).and.change_guild("Test Guild 2")
end

When(/^the character asks to join another branch of the Guild$/) do
  CharacterPage.new.visit_page(character_path(1)).and.change_branch("Branch 2")
end

When(/^the character asks to leave the Guild$/) do
  CharacterPage.new.visit_page(character_path(1)).and.leave_guild
end

# Validations

Then(/^an application to join the Guild should be displayed on the character's profile$/) do
  CharacterPage.new.check_for_guild("Test Guild", state: "join_pending")
end

Then(/^an application to join the Guild and branch should be displayed on the character's profile$/) do
  CharacterPage.new.check_for_guild("Test Guild", branch: "Branch 1", state: "join_pending")
end

Then(/^an application to join the new Guild should be displayed on the character's profile$/) do
  CharacterPage.new.check_for_guild("Test Guild 2", state: "change_pending")
end

Then(/^an application to join the new branch should be displayed on the character's profile$/) do
  CharacterPage.new.check_for_guild("Test Guild", branch: "Branch 1", state: "change_pending")
end

Then(/^an application to leave the Guild should be shown on the character's profile$/) do
  CharacterPage.new.check_for_guild("Test Guild", state: "leave_pending")
end

Then(/^the old Guild should be shown on the character's profile$/) do
  CharacterPage.new.check_for_guild("Test Guild")
end

Then(/^no Guild should be shown on the character's profile$/) do
  CharacterPage.new.check_for_guild("No guild")
end

Then(/^the character should be displayed as having provisionally joined the Guild at rank (.*?) on the character's profile page$/) do |rank|
  CharacterPage.new.check_for_guild("Test Guild", branch: nil, state: provisional, start_rank: rank)
end

Then(/^the character should be displayed as having joined the other Guild at rank (.*?) on the character's profile page$/) do |rank|
  CharacterPage.new.check_for_guild("Test Guild 2", branch: nil, state: nil, start_rank: rank)
end

Then(/^the character should be displayed as having provisionally joined the other Guild at rank (.*?) on the character's profile page$/) do |rank|
  CharacterPage.new.check_for_guild("Test Guild", branch: nil, state: nil, start_rank: rank)
end

Then(/^the character should be displayed as having left the Guild at rank (.*?) on the character's profile page$/) do |rank|
  CharacterPage.new.check_for_guild("No guild", branch: nil, state: nil, start_rank: rank)
end

Then(/^the character should remain unguilded\.$/) do
  CharacterPage.new.check_for_guild("No guild")
end

Then(/^the character should remain in the Guild\.$/) do
  CharacterPage.new.check_for_guild("Test Guild")
end

Then(/^the character should remain guildless on the character's profile page$/) do
  CharacterPage.new.check_for_guild("No guild")
end

Then(/^the character should become guildless on the character's profile page$/) do
  CharacterPage.new.check_for_guild("No guild")
end

Then(/^the character should remain in the first Guild on the character's profile page$/) do
  CharacterPage.new.check_for_guild("Test Guild")
end

Then(/^the character should return to the first Guild on the character's profile page$/) do
  CharacterPage.new.check_for_guild("Test Guild")
end

Then(/^an ejected from Guild email should be sent to the user$/) do
  EmailTestHelper.check_for_email(to: User.first.email, regarding: I18n.t("email.subject.guild_membership.ejected", character: Character.first, guild: Guild.find_by(name: "Test Guild")))
end
