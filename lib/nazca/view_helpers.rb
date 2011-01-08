module Nazca
  module ViewHelpers
    def tag!(tags = {})
      @tags ||= {}
      @tags.merge!(tags)
    end
  
    def title(t)
      tag!(:title => normalize(t).gsub(/<\/?[^>]*>/, ""))
      t
    end
  
    def keywords(k)
      tag!(:keywords => normalize(k))
      k
    end
  
     def description(d)
      tag!(:description => normalize(d))
      d
    end
 

    def noindex
      tag!(:noindex => true)
    end
 

    def nofollow(nofollow)
      tag!(:nofollow => true)
    end

		def canonical(href)
			tag!(:canonical => true)
		end
  

    def meta_tags(site_name, options = {})
      result = ""
			@tags ||= {}

			options[:separator] ||= "|"
			options[:reversed] ||= false
			
			options.merge!(@tags)
      
    	title = [site_name, options[:separator], options[:title]]
			title.reverse! if options[:reverse]
			result << content_tag(:title, title.join(' '))

     	result << tag(:meta, :name => :description, :content => options[:description]) if options[:description]
			result << tag(:meta, :name => :keywords, :content => options[:keywords]) if options[:keywords]

      return result.html_safe
    end
  
    private
  		# Normalizes output string so that it's tags are stripped
			def normalize(str)
				strip_tags(str)
			end
  end
end