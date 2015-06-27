module Jekyll
    module Tagger
        def tokenize(input)
            File.open('_temp', 'w') {|f| f.write(input)}
            result = `./_plugins/tagger.py _temp`
            `rm _temp`
            result
        end
    end
end

Liquid::Template.register_filter(Jekyll::Tagger)
