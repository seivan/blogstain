class Banned < ActiveRecord::Base
    attr_protected :ip
end
