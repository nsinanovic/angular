class Employer < ActiveRecord::Base

  def self.authenticate(email, password)
    employer = find_by_email(email)
    if employer && employer.password == password
      employer
    else
      nil
    end
  end
end
