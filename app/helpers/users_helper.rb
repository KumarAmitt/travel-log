module UsersHelper

  def profile_avatar
    if current_user.profile_pic.attached?
      image_tag current_user.profile_pic
    else
      image_tag '/assets/blank_profile.png'
    end
  end

end

