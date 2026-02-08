require_relative "spec_helper"

RSpec.describe Nazca::ViewHelpers do
  let(:template) { ActionView::Base.empty }

  it "should output base title only if there was no explicit title set earlier" do
    expect(template.meta_tags("My site")).to eq("<title>My site</title>")
  end

  it "should return the title after setting it" do
    expect(template.title("Test title")).to eq("Test title")
  end

  it "should display simple title" do
    template.title "Test title"
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title>")
  end

  it "should display simple title in reversed order with :reversed option" do
    template.title "Test title"
    expect(template.meta_tags("My site", :reverse => true)).to eq("<title>Test title | My site</title>")
  end

  it "should strip tags from title" do
    template.title "OMG, just found 3 kg of <sup>235</sup>U in my attic"
    expect(template.meta_tags("My site")).to eq("<title>My site | OMG, just found 3 kg of 235U in my attic</title>")
  end

  it "should deal with ampersand-escaped entities" do
    template.title "Uh, uh, time for some corporate &copy;!"
    expect(template.meta_tags("My site")).to eq("<title>My site | Uh, uh, time for some corporate &copy;!</title>")
  end

  it "should change title separator with :separator option" do
    template.title "Test title"
    expect(template.meta_tags("My site", :separator => "::")).to eq("<title>My site :: Test title</title>")
  end

  it "should display keywords meta tag (setting with meta_tags method)" do
    template.title "Test title"
    expect(template.meta_tags("My site", :keywords => "my,key,word")).to eq("<title>My site | Test title</title><meta name=\"keywords\" content=\"my,key,word\" />")
  end

  it "should display keywords meta tag (setting with seperate method)" do
    template.title "Test title"
    template.keywords "my,key,word"
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title><meta name=\"keywords\" content=\"my,key,word\" />")
  end

  it "should add description meta tag (setting with meta_tags method)" do
    template.title "Test title"
    expect(template.meta_tags("My site", :description => "Cute cats programming Ruby.")).to eq("<title>My site | Test title</title><meta name=\"description\" content=\"Cute cats programming Ruby.\" />")
  end

  it "should add description meta tag (setting with seperate method)" do
    template.title "Test title"
    template.description "Cute cats programming Ruby."
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title><meta name=\"description\" content=\"Cute cats programming Ruby.\" />")
  end

  it "should add both description and keywords meta tag" do
    template.title "Test title"
    template.description "Cute cats programming Ruby."
    template.keywords "my,key,word"
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title><meta name=\"description\" content=\"Cute cats programming Ruby.\" /><meta name=\"keywords\" content=\"my,key,word\" />")
  end

  it "should be included in ActionView::Base" do
    expect(ActionView::Base.included_modules).to include(Nazca::ViewHelpers)
  end

end
