module CharacterRecycleTestHelper
  module_function # Ensure that all subsequent methods are available as Module Functions

  def create_pending_character(user, name: "Testy McTesterson", race: Race.first, starting_points: 20, starting_florins: 0, starting_death_thresholds: 10, state: "active", title: "", no_title: false, declared_on: 5.years.ago)
      character = user.characters.create_with(race: race, starting_points: starting_points, starting_florins: starting_florins, starting_death_thresholds: starting_death_thresholds, state: state, title: title, declared_on: declared_on, no_title: no_title).find_or_create_by!(name: name)
      character.save!
      character
  end

  def create_approved_character(user, name: "Testy McTesterson", race: Race.first, starting_points: 20, starting_florins: 0, starting_death_thresholds: 10, state: "active", title: "", no_title: false, declared_on: 5.years.ago)
    character = create_pending_character(user, name, race, starting_points, starting_florins, starting_death_thresholds, state, title, no_title, declared_on)
    approve_character(user, character)
  end

  def create_rejected_character(user, name: "Testy McTesterson", race: Race.first, starting_points: 20, starting_florins: 0, starting_death_thresholds: 10, state: "active", title: "", no_title: false, declared_on: 5.years.ago)
    character = create_pending_character(user, name, race, starting_points, starting_florins, starting_death_thresholds, state, title, no_title, declared_on)
    reject_character(user, character)
  end

  def create_undeclared_character(user, name: "Testy McTesterson")
      create_pending_character(user, name: name, state: Character::Undeclared, declared_on: '2010-04-19')
  end

  def undeclare_character
      character = Character.first
      character.state = Character::Undeclared
      character.save!
  end

  def make_pending(character)
      character.approved = nil
      character.save!
  end

  def approve_character(user = nil, character = nil)
      user ||= User.first
      character ||= Character.first
      character.approve(user)
      character.save!
  end

  def retire_character
      character = Character.first
      character.state = Character::Retired
      character.save!
  end

  def permdeath_character
      character = Character.first
      character.state = Character::PermDead
      character.save!
  end

  def recycle_character
      character = Character.first
      character.state = Character::Recycled
      character.save!
  end

  # Change character attributes

  def update_starting_rank(character, points)
    character = Character.first
    character.starting_points = points
    character.save!
  end

  def update_title(title)
    character = Character.first
    character.title = title
    character.save!
  end

  def set_no_title
    character = Character.first
    character.no_title = true
    character.save!
  end


  # Validations

  def check_character_has_character_points(character: Character.first, points: 0)
    character.points.should eq points
  end
end
