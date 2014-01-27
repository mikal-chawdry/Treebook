module ApplicationHelper
  
  def flash_class(type)
    if type == :notice
      "alert-success"
    elsif type == :alert
      "alert-danger"
    else
      ""
    end
  end
end
