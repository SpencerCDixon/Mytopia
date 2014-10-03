class ZillowAPI
attr_reader :neighborhood, :data
  def initialize(neighborhood)
    @neighborhood = neighborhood
    @data = scrape
  end

  def scrape
    Rubillow::Neighborhood.demographics({ regionid: @neighborhood[:regionid],
                                          state: @neighborhood[:state],
                                          city: @neighborhood[:city] })
  end

  def people
    people_data = {}
    people_data[:age] = data.census_data["AgeDecade"]
    people_data[:kids] = data.census_data["Household"]
    people_data[:characteristics] = data.characteristics

    people_data
  end

  def with_kids
    (people[:kids]["WithKids"].value.to_f * 100).round(2)
  end

  def no_kids
    (people[:kids]["NoKids"].value.to_f * 100).round(2)
  end
end
