module JobsHelper
  FAKERS = [:Beer, :Food, :GameOfThrones, :HarryPotter, :LordOfTheRings, :Pokemon]

  SUB_FAKERS = {
    Beer: [:name, :style, :hop, :yeast, :malts, :ibu],
    Food: [:ingredient, :spice, :measurement],
    GameOfThrones: [:character, :house, :city, :dragon],
    HarryPotter: [:character, :location, :quote, :book],
    LordOfTheRings: [:character, :location],
    Pokemon: [:name, :location]
  }
  
  def get_fakers
    return FAKERS
  end

  def get_subfakers(key)
    return [] if key.nil?
    return SUB_FAKERS[key.to_sym] || []
  end
end
