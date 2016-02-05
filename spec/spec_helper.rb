# Require this file for unit tests
ENV['HANAMI_ENV'] ||= 'test'

require 'coveralls'
Coveralls.wear!

require_relative '../config/environment'
require 'minitest/autorun'

Hanami::Application.preload!
