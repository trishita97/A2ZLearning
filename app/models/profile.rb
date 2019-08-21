class Profile < ApplicationRecord
    belongs_to :user

    def display_name
        name = self.first_name
        name += " "+self.middle_name if self.middle_name?
        name += " "+self.last_name if self.last_name?
        return name
    end    
end
