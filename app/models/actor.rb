class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    full_name = "#{self.first_name} #{self.last_name}"
    full_name
  end

  def list_roles
    roles = []
    self.characters.each do |character|
        roles<<"#{character.name} - #{character.show.name}"
    end
    roles
  end
end

# peter = Actor.create(first_name: "Peter", last_name: "Dinklage")
#   thrones = Show.create(name: "Game of Thrones")
#   tyrion = Character.create(name: "Tyrion Lannister", actor_id: peter.id, show_id: thrones.id)
#   peter.list_roles