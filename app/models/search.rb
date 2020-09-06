class Search < ApplicationRecord

def search_announcements

    announcements = Announcement.all
    announcements = announcements.where(["title like ?", "%#{title}%"])
    announcements = announcements.where(["category like ?", "%#{category}%"])

    return announcements

end


end
