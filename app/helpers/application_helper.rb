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
  
  def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, attendance_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
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

end
