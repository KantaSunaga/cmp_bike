module MakersHelper
  def find_year(year_id)
    year_obj = Year.find(year_id)
    year_obj.year
  end
end
