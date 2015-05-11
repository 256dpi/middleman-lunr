# middleman-lunr

**middleman extension for a static indexed search using lunr.js**

Create a queryable index of your static site content to use with lunr.js.

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

```html
<%= JSON.generate(generate_search_index) %>
```

Load and query the index:

```js
function loadIndex(){
  $.getJSON('/search.json', function(data){
    var index = lunr.Index.load(data.index);
    var map = data.map
    index.search('Lunr.js').forEach(function(res){
      console.log(map[res.ref].title);
    });
  });
}
```
