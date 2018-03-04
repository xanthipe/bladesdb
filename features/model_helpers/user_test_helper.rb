include RSpec::Matchers

module UserTestHelper
  module_function # Ensure that all subsequent methods are available as Module Functions

  DEFAULT_PASSWORD = "Passw0rd"

  def create_or_find_user(name: "Norman Normal", email: "norman@mail.com", username: "normaluser", state: :pending)
    User.create_with(name: name, email: email, password: DEFAULT_PASSWORD, state: state).find_or_create_by(username: username)
  end

  def create_or_find_another_user(name: "Ann Other", email: "another@mail.com", username: "anotheruser", state: :pending)
    User.create_with(name: name, email: email, password: DEFAULT_PASSWORD, state: state).find_or_create_by(username: username)
  end

  def create_or_find_admin_user(name: "Adam Admin", email: "admin@mail.com", username: "adminuser")
    user = User.create_with(name: name, email: email, password: DEFAULT_PASSWORD, state: :pending).find_or_create_by(username: username)
    confirm(user)
    approve(user)
    make_admin(user)
    user
  end

  def make_admin(user)
    user.roles << Role.find_by(rolename: 'administrator')
    user.save
  end

  def confirm(user)
    user.confirmed_at = Time.now
    user.activate
    user.save
  end

  def approve(user)
    user.approve
    user.save
  end

  def suspend(user)
    user.suspend
    user.save
  end

  def delete(user)
    user.delete
    user.save
  end

  def grant_role(user, role)
    Permission.find_or_create_by(user: user, role: role)
  end

  def fill_in_all_details(user, mobile_number: "07777 888777", contact_name: "Bob Bobson", contact_number: "07888 777888", medical_notes: "Allergic to bees.", food_notes: "Intolerant to lactose.", notes: "Some notes.")
    updating_user = User.find_by(name: user.name)
    updating_user.updating = true
    updating_user.update!(mobile_number: mobile_number, contact_name: contact_name, contact_number: contact_number, medical_notes: medical_notes, food_notes: food_notes, notes: notes, emergency_last_updated: Date.today)
  end

end
