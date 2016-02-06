require 'hanami/model'
require 'hanami/mailer'
Dir["#{ __dir__ }/koala/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/koala_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/koala_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/koala_development'
  #    adapter type: :sql, uri: 'mysql://localhost/koala_development'
  #
  adapter type: :memory, uri: ENV['KOALA_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  mapping "#{__dir__}/config/mapping"
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/koala/mailers"

  # See http://hanamirb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
