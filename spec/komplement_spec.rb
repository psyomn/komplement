require 'spec_helper'
require 'komplement'

describe Komplement do
  it "should have a VERSION constant" do
    expect(subject.const_get('VERSION')).to_not be_empty
  end

  describe Base do
    it "should detect common html elements" do
      ret = Komplement::Base
              .new
              .with_ignored(Komplement::HTML_ELEMENTS)
              .in_filetypes(['html'])
              .in_dirs(['./spec/files/'])
              .find_offenses

      expect(ret).to_not be_empty
      expect(ret['./spec/files/bad_html.html']).to eq(['potato'])
    end

    it "should detect everything if no exclusion list is given" do
      ret = Komplement::Base
              .new
              .with_ignored([])
              .in_filetypes(['html'])
              .in_dirs(['./spec/files/'])
              .find_offenses

      expect(ret).to_not be_empty

      expect(ret['./spec/files/bad_html.html']).to eq([
        "html", "text", "head", "text", "text", "text", "text",
        "potato", "text", "h1", "body", "text", "html", "document"])
    end

    it "should ignore custom elements if specified so" do
      ret = Komplement::Base
              .new
              .with_ignored(Komplement::HTML_ELEMENTS)
              .with_ignored(['potato'])
              .in_filetypes(['html'])
              .in_dirs(['./spec/files/'])
              .find_offenses

      expect(ret).to be_empty
    end
  end
end
