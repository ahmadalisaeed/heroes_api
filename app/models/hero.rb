class Hero < BaseResource
  self.collection_name = 'hero'

  def abilities
    Ability.all.select{|ability| ability.hero.id == id}
  end
end