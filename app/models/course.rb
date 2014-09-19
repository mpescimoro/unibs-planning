class Course < ActiveRecord::Base

  def academic_year
    "A.A. #{year}/#{year+1}"
  end
end
