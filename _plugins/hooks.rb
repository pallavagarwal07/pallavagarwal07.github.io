require 'open3'

def get_password(content)
  return content[/password:\s*"([^"]+)"/, 1]
end

module Jekyll
  class CptConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.cpt$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      stdout_str, error_str, status = Open3.capture3(
          'go run _plugins/decrypt.go', stdin_data: content)
      if status != 0 or error_str != ""
        raise "Decryption protocol failed."
      end

      password = get_password(stdout_str)
      if password == nil
        raise "Unable to find password in encrypted file."
      end
      decrypted = Jekyll::Converters::Markdown.new(@config).convert(stdout_str)
      stdout_str, error_str, status = Open3.capture3(
          {"MASTER_KEY_VARSTACK" => password},
          'go run _plugins/encrypt.go', stdin_data: decrypted)
      if status != 0 or error_str != ""
        raise "Encryption protocol failed."
      end
      ret = "<pre>-----BEGIN ENCRYPTED CONTENT-----\n" +
        stdout_str + "\n" +
        "-----END ENCRYPTED CONTENT-----</pre>"
      return ret
    end
  end
end
