class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    interested_patrons = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if interested_patrons[exhibit] && patron.interests.include?(exhibit.name)
          interested_patrons[exhibit] << patron
        elsif patron.interests.include?(exhibit.name)
          interested_patrons[exhibit] = [patron]
        elsif !interested_patrons[exhibit] && !patron.interests.include?(exhibit.name)
          interested_patrons[exhibit] = []
        end
      end
    end
    interested_patrons
  end

end
