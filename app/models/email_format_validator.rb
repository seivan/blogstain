class EmailFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors[attribute] << "Needs to contain an @." unless value =~ /@/
      record.errors[attribute] << "Has to end with .com, .org, .net, etc." unless value =~ /\.[^\.]+$/
      record.errors[attribute] << "Must have an address before the @" unless value =~ /^.+@/
      record.errors[attribute] << "Must be of the format 'something@something.xxx" unless value =~ /^[^@]+@[^@]+$/
    end
end