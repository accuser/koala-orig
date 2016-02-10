require 'spec_helper'

module Web::Views::Password
  class Form
    include Web::View

    layout nil
  end
end

describe Web::Views::Password::Form do
  let(:params) { Hash[] }
  let(:exposures) { Hash[ params: params ] }
  let(:template) { Hanami::View::Template.new('apps/web/templates/password/_form.html.haml') }
  let(:view) { described_class.new(template, exposures) }
  let(:rendered) { view.render }
end
