require 'paperclip/media_type_spoof_detector'         
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end

Paperclip.options[:command_path] = 'C:\ImageMagick'