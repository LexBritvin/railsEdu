module ApplicationHelper
  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
          (" ".html_safe) +
          (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thank for visiting me from #{session[:source]}"
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    BritvinViewTool::Renderer.copyright 'Aleksandr Britvin', 'All rights reserved'
  end

  def nav_items
    [
        {
            url: root_path,
            title: "Home",
        },
        {
            url: about_path,
            title: "About",
        },
        {
            url: contact_path,
            title: "Contact",
        },
        {
            url: blogs_path,
            title: "Blog",
        },
        {
            url: portfolios_path,
            title: "Portfolio",
        },
        {
            url: tech_news_path,
            title: "Tech news",
        },
    ]
  end

  def nav_helper(style = '', tag_type = nil)
    nav_links = ""
    nav_items.each do |item|
      nav_links << "<#{tag_type}>" unless tag_type.nil? || tag_type.empty?
      nav_links << link_to(item[:title], item[:url], class: "#{style} #{active? item[:url]}")
      nav_links << "</#{tag_type}>" unless tag_type.nil? || tag_type.empty?
    end
    nav_links.html_safe
  end

  def active?(path)
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator(msg)
    js add_gritter(msg, title: "Test", sticky: false)
  end

end
