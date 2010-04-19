class EmailFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors[attribute] << I18n.t("validation.email.at") unless value =~ /@/
      record.errors[attribute] << I18n.t("validation.email.end") unless value =~ /\.[^\.]+$/
      record.errors[attribute] << I18n.t("validation.email.address") unless value =~ /^.+@/
      record.errors[attribute] << I18n.t("validation.email.format") unless value =~ /^[^@]+@[^@]+$/
    end
end