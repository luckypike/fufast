I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

I18n.available_locales = [:ru]
I18n.default_locale = :ru

Rails.application.config.i18n.fallbacks = true
