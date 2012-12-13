module Fsck
  def method_missing(method_name, *args, &block)
    fscked_method = __fsck_method__(method_name)

    if fscked_method
      target = singleton_methods.include?(fscked_method) ? singleton_class : self.class
      target.class_exec { alias_method(method_name, fscked_method) }
      send(method_name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    !!__fsck_method__(method_name)
  end

  private

  def __fsck_method_regex_str__(method)
    words = method.to_s.delete("!?=").split("_").map { |w| Regexp.escape(w) }
    "(\\w*_)?#{words.join('\w*_\w*')}(_\\w*)?"
  end

  def __fsck_method__(method_name)
    fscked_method = method_name.to_s

    if punctuation = fscked_method[/[!?=]$/]
      fscked_method.chop!
    end

    matches = methods.select do |method|
      fscked_method =~ /^#{__fsck_method_regex_str__(method)}#{punctuation}$/
    end

    matches.max_by(&:length)
  end
end
