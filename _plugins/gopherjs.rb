module Jekyll
  class GopherFile < StaticFile
    def initialize(site, base, dir, name)
      super
    end
  end

  class GopherJS < Generator
    safe true

    def generate(site)
      site.static_files.each { |f|
        if f.name.end_with?(".go")
          out = f.path.gsub(site.source, site.dest).gsub(/\.go$/, ".js")
          jsname = f.name.gsub(/\.go$/, ".js")
          dir = f.path.gsub(/#{f.name}$/, "").gsub(site.source, "")
          tmpdir = `mktemp -t -d`.strip
          `mkdir #{tmpdir}/#{dir}`

          cmd = "gopherjs build -m -o #{tmpdir}/js/#{jsname} #{f.path}"
          `#{cmd}`
          if !$?.success?
            throw "gopherjs build failed for #{f.name}"
          end

          `gzip < #{tmpdir}/js/#{jsname} > #{tmpdir}/js/#{jsname}.gz`
          if !$?.success?
            throw "gzip compression failed for #{f.name}"
          end

          site.static_files << GopherFile.new(
            site, tmpdir, dir, f.name.gsub(/\.go$/, ".js"))
          site.static_files << GopherFile.new(
            site, tmpdir, dir, f.name.gsub(/\.go$/, ".js.map"))
          site.static_files << GopherFile.new(
            site, tmpdir, dir, f.name.gsub(/\.go$/, ".js.gz"))
        end
      }
      site.static_files.reject! { |f| f.name.end_with?(".go") }
    end
  end
end
