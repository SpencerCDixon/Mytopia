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

  def desc_income
    people[:characteristics]["Income"]
  end

  def desc_employment
    people[:characteristics]["Employment"]
  end

  def desc_education
    people[:characteristics]["Education"]
  end

  def home_info
    home_data = {}
    home_data[:owners] = data.metrics["Home & Real Estate Data"]["Owners"][:neighborhood].value

    home_data
  end

  def home_owners
    (home_info[:owners].to_f * 100).round(2)
  end

  def median_income
    @data.metrics["People Data"]["Median Household Income"][:neighborhood].value
  end

  def single_males
    @data.metrics["People Data"]["Single Males"][:neighborhood].value.to_f * 100
  end

  def single_females
    @data.metrics["People Data"]["Single Females"][:neighborhood].value.to_f * 100
  end

  def median_age
    @data.metrics["People Data"]["Median Age"][:neighborhood].value
  end

  def property_tax
    @data.affordability_data["Property Tax"][:neighborhood].value
  end

  def sq_foot
    @data.affordability_data["Median Value Per Sq Ft"][:neighborhood].value
  end

  def median_list_price
    @data.affordability_data["Median List Price"][:neighborhood].value
  end

  def median_sale_price
    @data.affordability_data["Median Sale Price"][:neighborhood].value 
  end



end
