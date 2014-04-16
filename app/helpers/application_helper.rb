module ApplicationHelper
  def edit_icon
    content_tag(:i, "", class: "fi-page-edit")
  end

  def trash_icon
    content_tag(:i, "", class: "fi-trash")
  end

end
