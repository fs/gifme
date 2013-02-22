class YoutubeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^((http|https):\/\/)?www.youtube.com\/(watch)?\?.*v=.*$/
      record.errors[attribute] << (options[:message] || "is not youtube url")
    end
  end
end
