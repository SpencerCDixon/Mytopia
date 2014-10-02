class ZillowAPI
attr_reader :neighborhood
  def initialize(neighborhood)
    @neighborhood = neighborhood
    @data = scrape
  end

  def scrape
    Rubillow::Neighborhood.demographics({ regionid: @neighborhood[:regionid],
                                          state: @neighborhood[:state],
                                          city: @neighborhood[:city] })
  end
end
