module GroupsHelper

  def group_icon(group)
    if group.icon.attached?
      image_tag group.icon, class: 'travel_item_icon'
    else
      image_tag '/assets/travel_icon.jpg', class: 'travel_item_icon'
    end
  end

end

