# nazca

Nazca is a Rails gem to easily deal with all your `<title>` and `<meta>` tags, making your app more usable for people and more visible for search engines.

## Why?

Using instance variables for this purpose seemed so scruffy. Wrapping some code in this little gem made my layout templates much smaller and cleaner as I could add all my meta tags in a single line of code.

## Usage

```erb
<%= meta_tags "My awesome little site" %>
```

will yield: `<title>My awesome little site</title>`

```erb
# In views/posts/new.html.erb
<% title "Creating a post" %>

# In views/layouts/application.html.erb
<%= meta_tags "My awesome little site" %>
```

gives `<title>My awesome little site | Creating a post</title>`.

You can specify the title inside a header tag as the `title` method returns the title itself:

```erb
<h1><%= title "Creating a post" %></h1>
```

### Reversing order

```erb
<%= meta_tags "My awesome little site", reverse: true %>
```

which yields `<title>Creating a post | My awesome little site</title>`

### Setting a custom separator

```erb
<%= meta_tags "My awesome little site", reverse: true, separator: "::" %>
```

yields:

```html
<title>Creating a post :: My awesome little site</title>
```

### Setting description and keywords meta tags

```erb
<% title "Creating a post" %>
<% keywords "omg,so,sweet" %>
<% description "Cute cats programming Ruby." %>
<%= meta_tags "My awesome little site" %>
```

yields:

```html
<title>My awesome little site | Creating a post</title>
<meta name="description" content="Cute cats programming Ruby." />
<meta name="keywords" content="omg,so,sweet" />
```

### Controlling indexing and the canonical URL

```erb
<% noindex %>
<% nofollow %>
<% canonical "https://example.com/posts/42" %>
<%= meta_tags "My awesome little site" %>
```

yields:

```html
<title>My awesome little site</title>
<meta name="robots" content="noindex, nofollow" />
<link rel="canonical" href="https://example.com/posts/42" />
```

`noindex` and `nofollow` can be used independently or together; they are combined into a single `robots` meta tag.

## Why are there no controller methods to globally set up meta tags?

Because I respect MVC. Meta tags are view-specific.

## License

MIT.
