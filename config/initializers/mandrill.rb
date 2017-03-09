config_yaml = File.read(Rails.root.join('config/mandrill.yml'))
config_hash = YAML.load(ERB.new(config_yaml).result).symbolize_keys
Rails.application.config.email_meta_data = config_hash
Rails.application.config.mandrill_api_key = ENV.fetch("SMTP_PASSWORD")