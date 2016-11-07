require 'middleman-core'

require 'middleman-lunr/indexer'

class Lunr < ::Middleman::Extension
  helpers do
    def generate_search_index(options = {})
      Middleman::Lunr::Indexer.new(self).generate({
        data: [:title],
        body: true
      }.merge(options))
    end
  end
end

::Middleman::Extensions.register(:lunr, Lunr)
