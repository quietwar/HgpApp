module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
  end
  
  def admin_user_signed_in?
    current_admin_user != nil
  end

  def resource_name
     :user
 end

 def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def avatar_profile_link(user, image_options={}, html_options={})
  avatar_url = nil
  unless user.nil?
    avatar_url = user.avatar? ? user.avatar.url(:thumb) : nil
    link_to(image_tag(avatar_url, image_options), profile_path(user.profile_name), html_options)
  end
end
  def bootstrap_class_for(flash_type)
    {
        success: "alert-success",
        error: "alert-error",
        alert: "alert-danger",
        notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def bootstrap_glyphs_icon(flash_type)
    {
        success: "glyphicon-ok",
        error: "glyphicon-exclamation-sign",
        alert: "glyphicon-warning-sign",
        notice: "glyphicon-info-sign"
    }[flash_type.to_sym] || 'glyphicon-screenshot'
  end

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end

  def current_user
     @current_user ||= User.find_by_id(session[:user])
  end

  def prefered_color
    return current_user.color if (current_user && current_user.color.present?)
    '#fff'
  end

end
