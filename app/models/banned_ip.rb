class BannedIp < ActiveRecord::Base
    attr_protected :ip
end
