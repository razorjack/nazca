# nazca

Nazca is a Rails 3 plugin to easily deal with all your `<title>` and `<meta>` tags, making your app more usable for people and more visible for search engines.
  
## Why?

Using instance variables for this purpose seemed so scruffy. Wrapping some code in this little plugin made my layout templates much smaller and cleaner as I could add all my meta tags in a single line of code.

## Usage

    <%= meta_tags "My awesome little site" %>
  
will yield `<title>My awesome little site</title>`.


    # In views/posts/new.html.erb
    <% title "Creating a post" %>
  
    # In views/layouts/application.html.erb
    <%= meta_tags "My awesome little site" %>

gives `<title>My awesome little site | Creating a new post</title>`.

You can specify the title inside a header tag as the `title` method returns the title itself:

    <h1><%= title "Creating a post" %></h1>

### Reversing order

    <%= meta_tags "My awesome little site", :reverse => true %>
    
which yields `<title>Creating a new post | My awesome little site</title>`

### Setting a custom separator

    <%= meta_tags "My awesome little site", :reverse => true, :separator => "::" %>
    <title>Creating a new post :: My awesome little site</title>
    
    
### Setting description and keywords meta tag:

    <% title "Creating a post" %>
    <% keywords "omg,they,are,so,hot" %>
    <% description "Cute girls programming Ruby." %>
    <%= meta_tags "My awesome little site" %>

    <title>My awesome little site | Creating a post</title>
    <meta content="Cute girls programming Ruby." name="description" />
    <meta content="omg,they,are,so,hot" name="keywords" />
  
## Why there are no controller methods to globally set up meta tags?

Because I respect MVC. Meta tags are views-specific.
  
## Ruby 1.9?

Both 1.8 and 1.9.

## Rails 2?

Fork you.

## License

MIT.