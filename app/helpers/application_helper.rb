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
  

  def self.find_duplicates(array)
    # array.select{ |item| array.count(item) > 1 }.uniq

    array.select{ |item| ApplicationHelper.count_in_array(array, item) > 1 }.uniq

  end


  def self.count_duplicates(obj)
    obj.to_s.downcase.split("").group_by(&:itself).map{ |k,v| [k, v.size] }.select{ |a| a[1] > 1 }.size
  end

  def self.count_in_array(array, element)
    count = 0;

    array.each do |item| 
      count += 1 if item == element
    end
    
    return count

  end

end
