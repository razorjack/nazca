require File.dirname(__FILE__) + '/spec_helper'

describe Nazca::ViewHelpers do
  before :each do
    @template = ActionView::Base.new
  end
  
  it "should output base title only if there was no explicit title set earlier" do
    @template.meta_tags("My site").should == "<title>My site</title>"
  end
  
  it "should return the title after setting it" do
    @template.title("Test title").should == "Test title"
  end
  
  it "should display simple title" do
    @template.title "Test title"
    @template.meta_tags("My site").should == "<title>My site | Test title</title>"
  end
  
  it "should display simple title in reversed order with :reversed option" do
    @template.title "Test title"
    @template.meta_tags("My site", :reverse => true).should == "<title>Test title | My site</title>"
  end
  
  it "should strip tags from title" do
    @template.title "OMG, just found 3 kg of <sup>235</sup>U in my attic"
    @template.meta_tags("My site").should == "<title>My site | OMG, just found 3 kg of 235U in my attic</title>"
  end
  
  it "should deal with ampersand-escaped entities" do
    @template.title "Uh, uh, time for some corporate &copy;!"
    @template.meta_tags("My site").should == "<title>My site | Uh, uh, time for some corporate &copy;!</title>"
  end
  
  it "should change title separator with :separator option" do
    @template.title "Test title"
    @template.meta_tags("My site", :separator => "::").should == "<title>My site :: Test title</title>"
  end
  
  it "should display keywords meta tag (setting with meta_tags method)" do
    @template.title "Test title"
    @template.meta_tags("My site", :keywords => "my,key,word").should == "<title>My site | Test title</title><meta content=\"my,key,word\" name=\"keywords\" />"
  end
  
  it "should display keywords meta tag (setting with seperate method)" do
    @template.title "Test title"
    @template.keywords "my,key,word"
    @template.meta_tags("My site").should == "<title>My site | Test title</title><meta content=\"my,key,word\" name=\"keywords\" />"
  end
  
  it "should add description meta tag (setting with meta_tags method)" do
    @template.title "Test title"
    @template.meta_tags("My site", :description => "Cute cats programming Ruby.").should == "<title>My site | Test title</title><meta content=\"Cute cats programming Ruby.\" name=\"description\" />"
  end
  
  it "should add description meta tag (setting with seperate method)" do
    @template.title "Test title"
    @template.description "Cute cats programming Ruby."
    @template.meta_tags("My site").should == "<title>My site | Test title</title><meta content=\"Cute cats programming Ruby.\" name=\"description\" />"
  end
  
  it "should add both description and keywords meta tag" do
    @template.title "Test title"
    @template.description "Cute cats programming Ruby."
    @template.keywords "my,key,word"
    @template.meta_tags("My site").should == "<title>My site | Test title</title><meta content=\"Cute cats programming Ruby.\" name=\"description\" /><meta content=\"my,key,word\" name=\"keywords\" />"
  end
  
  it "should be included in ActionView::Base" do
    ActionView::Base.included_modules.should include Nazca::ViewHelpers
  end
  
end
