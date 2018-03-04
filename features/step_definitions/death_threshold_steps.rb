Then(/^the character should be left with (\d+) death thresholds$/) do |dts|
  CharacterPage.new.visit_page(character_page(Character.first)).and.check_for_death_thresholds(dts)
end

Then(/^the character's death thresholds should remain at (\d+)$/) do |dts|
  CharacterPage.new.visit_page(character_page(Character.first)).and.check_for_death_thresholds(dts)
end

Then(/^the character should still have (\d+) death thresholds$/) do |dts|
  CharacterPage.new.visit_page(character_page(Character.first)).and.check_for_death_thresholds(dts)
end
