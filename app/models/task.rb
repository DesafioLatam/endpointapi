class Task < ActiveRecord::Base

  def self.find_unarchived(id)
    find_by!(id: id, archived: false)
  end

  def archived
    self.archived = true
    self.save
  end

end
