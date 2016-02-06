require 'spec_helper'

describe Web::Views::ApplicationLayout do
  let(:layout) { described_class.new(nil, nil) }

  describe "#copyright_notice" do
    it "returns a copyright notice" do
      expect(layout).to receive(:copyright_year).and_return(1970)

      expect(layout.copyright_notice).to eq "Copyright © 1970"
    end
  end

  describe "#copyright_year" do
    it "returns the current year" do
      expect(Time).to receive(:now).and_return(Time.at(0))
    
      expect(layout.copyright_year).to eq 1970
    end
  end

  describe "#link_to_organization" do
    it "returns an HTML <a> tag" do
      expect(layout.link_to_organization).to eq %Q(<a href="https://github.com/SouthwestKoala">Southwest Koala</a>)
    end
  end
end
