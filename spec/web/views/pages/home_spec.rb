require 'spec_helper'
require_relative '../../../../apps/web/views/pages/home'

describe Web::Views::Pages::Home do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/pages/home.html.haml') }
  let(:view)      { Web::Views::Pages::Home.new(template, exposures) }
  let(:rendered)  { view.render }
end
