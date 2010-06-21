class BannedIp
  include Mongoid::Document
  include Mongoid::Timestamps
  field :ip
end
