class EmailFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors[attribute] << t("validation.email.at") unless value =~ /@/
      record.errors[attribute] << t("validation.email.end") unless value =~ /\.[^\.]+$/
      record.errors[attribute] << t("validation.email.address") unless value =~ /^.+@/
      record.errors[attribute] << t("validation.email.format") unless value =~ /^[^@]+@[^@]+$/
    end
end