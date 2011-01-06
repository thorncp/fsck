module Fsck
  def method_missing(sym, *args, &block)
    fscked_method = sym.to_s
    
    if punctuation = fscked_method[/[!?=]$/]
      fscked_method.chop!
    end
    
    matches = methods.select do |m|
      fscked_method =~ /^#{__fsck_method_regex_str__(m)}#{punctuation}$/
    end

    if matches.empty?
      super
    else
      target = singleton_class rescue self.class
      target.class_exec { alias_method sym, matches.sort_by(&:length).last }
      send(sym, *args, &block)
    end
  end
  
  private
  def __fsck_method_regex_str__(method)
    words = method.to_s.delete("!?=").split("_").map { |w| Regexp.escape(w) }
    "(\\w*_)?#{words.join('\w*_\w*')}(_\\w*)?"
  end
end
