Cms::Fortress.configure do |config|
  # comment the line below if you want to use the default layout
  config.theme = :wide

  # Turn on site selector on login page
  # config.login_site_selector = true

  # Turn off page workflow options
  # config.enable_page_workflow = false
  # Turn off page caching options
  # config.enable_page_caching = false

  # Add new resource to contents
  # config.content_resources << {
  #   name: 'my_role_detail',
  #   title: 'i18n.label.title', # this is passed to the t() function - can be plain text
  #   path:  'admin_my_role_details_path'
  # }

  # Add new resource to settings
  # config.settings_resources << {
  #   name: 'my_role_detail',
  #   title: 'i18n.label.title', # this is passed to the t() function - can be plain text
  #   path:  'admin_my_role_details_path'
  # }

  # Add new resource to design
  # config.design_resources << {
  #   name: 'my_role_detail',
  #   title: 'i18n.label.title', # this is passed to the t() function - can be plain text
  #   path:  'admin_my_role_details_path'
  # }

  config.content_resources << {
      name: 'template_mails',
      title: 'Шаблоны писем',
      path:  'admin_template_mails_path'
  }
  config.content_resources << {
      name: 'feedbacks',
      title: 'Сообщения обратной связи',
      path:  'admin_feedbacks_path'
  }
  config.content_resources << {
      name: 'feed_back_forms',
      title: 'Формы обратной связи',
      path:  'admin_feed_back_forms_path'
  }
  config.content_resources << {
      name: 'feed_back_form_fields',
      title: 'Элементы формы обратной связи',
      path:  'admin_feed_back_form_fields_path'
  }

end
