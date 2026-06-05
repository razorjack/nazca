# frozen_string_literal: true

require_relative "spec_helper"

RSpec.describe Nazca::ViewHelpers do
  let(:template) { ActionView::Base.empty }

  it "renders the base title only when no title was set earlier" do
    expect(template.meta_tags("My site")).to eq("<title>My site</title>")
  end

  it "returns the title after setting it" do
    expect(template.title("Test title")).to eq("Test title")
  end

  it "renders the title appended to the site name" do
    template.title "Test title"
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title>")
  end

  it "renders the title before the site name with reverse: true" do
    template.title "Test title"
    expect(template.meta_tags("My site", reverse: true)).to eq("<title>Test title | My site</title>")
  end

  it "strips HTML tags from the title" do
    template.title "OMG, just found 3 kg of <sup>235</sup>U in my attic"
    expect(template.meta_tags("My site")).to eq("<title>My site | OMG, just found 3 kg of 235U in my attic</title>")
  end

  it "leaves ampersand-escaped entities untouched" do
    template.title "Uh, uh, time for some corporate &copy;!"
    expect(template.meta_tags("My site")).to eq("<title>My site | Uh, uh, time for some corporate &copy;!</title>")
  end

  it "changes the title separator with the separator: option" do
    template.title "Test title"
    expect(template.meta_tags("My site", separator: "::")).to eq("<title>My site :: Test title</title>")
  end

  it "renders the keywords meta tag set via meta_tags" do
    template.title "Test title"
    expect(template.meta_tags("My site", keywords: "my,key,word")).to eq("<title>My site | Test title</title><meta name=\"keywords\" content=\"my,key,word\" />")
  end

  it "renders the keywords meta tag set via the keywords helper" do
    template.title "Test title"
    template.keywords "my,key,word"
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title><meta name=\"keywords\" content=\"my,key,word\" />")
  end

  it "renders the description meta tag set via meta_tags" do
    template.title "Test title"
    expect(template.meta_tags("My site", description: "Cute cats programming Ruby.")).to eq("<title>My site | Test title</title><meta name=\"description\" content=\"Cute cats programming Ruby.\" />")
  end

  it "renders the description meta tag set via the description helper" do
    template.title "Test title"
    template.description "Cute cats programming Ruby."
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title><meta name=\"description\" content=\"Cute cats programming Ruby.\" />")
  end

  it "renders both the description and keywords meta tags" do
    template.title "Test title"
    template.description "Cute cats programming Ruby."
    template.keywords "my,key,word"
    expect(template.meta_tags("My site")).to eq("<title>My site | Test title</title><meta name=\"description\" content=\"Cute cats programming Ruby.\" /><meta name=\"keywords\" content=\"my,key,word\" />")
  end

  it "renders a robots noindex meta tag" do
    template.noindex
    expect(template.meta_tags("My site")).to eq("<title>My site</title><meta name=\"robots\" content=\"noindex\" />")
  end

  it "renders a robots nofollow meta tag" do
    template.nofollow
    expect(template.meta_tags("My site")).to eq("<title>My site</title><meta name=\"robots\" content=\"nofollow\" />")
  end

  it "combines noindex and nofollow into a single robots meta tag" do
    template.noindex
    template.nofollow
    expect(template.meta_tags("My site")).to eq("<title>My site</title><meta name=\"robots\" content=\"noindex, nofollow\" />")
  end

  it "renders a canonical link tag" do
    template.canonical "https://example.com/posts/42"
    expect(template.meta_tags("My site")).to eq("<title>My site</title><link rel=\"canonical\" href=\"https://example.com/posts/42\" />")
  end

  it "returns the href after setting the canonical link" do
    expect(template.canonical("https://example.com/posts/42")).to eq("https://example.com/posts/42")
  end

  it "is included in ActionView::Base" do
    expect(ActionView::Base.included_modules).to include(Nazca::ViewHelpers)
  end
end
