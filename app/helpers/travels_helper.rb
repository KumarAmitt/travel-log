module TravelsHelper
  def travel_icon(travel)
    if travel.groups.first.nil?
      image_tag '/assets/travel_icon.jpg', class: 'travel_item_icon'
    else
      image_tag travel.groups.first.icon, class: 'travel_item_icon'
    end
  end
end
