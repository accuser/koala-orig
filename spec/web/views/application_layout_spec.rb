require 'spec_helper'
require_relative '../../../apps/web/views/application_layout'

describe Web::Views::ApplicationLayout do
  let(:layout) { Web::Views::ApplicationLayout.new(nil, nil) }

  describe "#copyright_notice" do
    it "returns a copyright notice" do
      layout.stub(:copyright_year, 1970) do
        layout.copyright_notice.must_equal "Copyright © 1970"
      end
    end
  end

  describe "#copyright_year" do
    it "returns the current year" do
      Time.stub(:now, Time.at(0)) do
        layout.copyright_year.must_equal 1970
      end
    end
  end

  describe "#link_to_organization" do
    it "returns an HTML <a> tag" do
      layout.link_to_organization.must_equal %Q(<a href="https://github.com/SouthwestKoala">Southwest Koala</a>)
    end
  end
end
