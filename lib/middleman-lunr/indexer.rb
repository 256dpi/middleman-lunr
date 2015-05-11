require 'middleman-core'
require 'v8'

module Middleman::Lunr
  class Indexer
    def initialize(extension)
      @extension = extension
    end

    def generate(options)
      docs = []
      fields = []

      if options[:body]
        fields.push(:body)
      end

      options[:data].each do |d|
        fields.push(d)
      end

      @extension.sitemap.resources.each do |res|
        if res.data[:index]
          doc = { id: res.url.to_s }

          if options[:body]
            doc[:body] = File.read(res.source_file)
          end

          options[:data].each do |d|
            doc[d] = res.data[d]
          end

          docs << doc
        end
      end

      cxt = V8::Context.new
      cxt.load(File.expand_path('../../../js/lunr.min.js', __FILE__))
      cxt.eval('lunr.Index.prototype.indexJson = function(){return JSON.stringify(this);}')
      ref = cxt.eval('lunr')

      lunr_conf = proc do |this|
        this.ref('id')
        fields.each do |name|
          this.field(name) #, {:boost => boost})
        end
      end

      idx = ref.call(lunr_conf)

      docs.each do |doc|
        idx.add(doc)
      end

      idx.indexJson()
    end
  end
end
