module ApplicationHelper
    
  def link_to_image(image_path, target_link,options={})
    link_to(image_tag(image_path, :border => "1"), target_link, options)
  end
  
  def check_user
    if !current_user
      redirect_to root_path #root_url
    end
  end
  
  def current_user
    User.where(id: session[:user_id]).first
  end
  
  
end
