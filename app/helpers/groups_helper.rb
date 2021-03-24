module GroupsHelper

  def group_icon(group)
    if group.icon.attached?
      image_tag group.icon
    else
      image_tag '/assets/travel_icon.jpg'
    end
  end

end

