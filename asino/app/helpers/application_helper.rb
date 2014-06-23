module ApplicationHelper
  def nav_link(link_text, link_path)
    if current_page?(link_path)
      content_tag(:li, :class => 'active') { link_to(link_text, link_path) }
    else
      content_tag(:li) { link_to(link_text, link_path) }
    end
  end
end
