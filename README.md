# middleman-lunr

**middleman extension for a static indexed search using lunr.js**

Create a queryable index of your static site content to use with lunr.js.

A demo can be found at: <https://docs.shiftr.io>.

## Usage

Add gem to your Gemfile:

```ruby
gem 'middleman-lunr'
```

Activate the extension in `config.rb`:

```ruby
activate :lunr
```

Create a JSON template `source/search.json.erb` and generate the index and map:

```html
<%= JSON.generate(generate_search_index({data: [:title, :description]})) %>
```
- The generated json will include the lunr.js index under the `index` key and a map that translates lunr.js references to your middleman pages under the `map` key.
- The `data` argument is an array of [frontmatter](https://middlemanapp.com/basics/frontmatter/) variables that you'd like to include in the map.

Load and query the index:

```js
var index;
var map;

function loadIndex(){
  $.getJSON('/search.json', function(data){
    index = lunr.Index.load(data.index);
    map = data.map
  });
}

function queryIndex(term) {
  index.search(term).forEach(function(res){
    // use the map to get the page title
    console.log(map[res.ref].title);
  });
}
```
