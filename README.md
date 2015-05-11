# middleman-lunr

**middleman extension for static indexed search using lunr.js**

## Usage

Add gem to your Gemfile:

```ruby
gem 'middleman-lunr'
```

Activate the extension:

```ruby
activate :lunr
```

Create a JSON template `search.json.erb` and generate the index:

```erb
<%= generate_search_index %>
```
