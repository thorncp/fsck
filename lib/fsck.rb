module Fsck
  def method_missing(sym, *args, &block)
    fscked_method = sym.to_s
    
    if punctuation = fscked_method[/[!?=]$/]
      fscked_method.chop!
    end
    
    matches = methods.select do |m|
      fscked_method =~ /^#{__fsck_cache__(m)}#{punctuation}$/
    end

    if matches.empty?
      super
    else
      send(matches.sort_by(&:length).last, *args, &block)
    end
  end
  
  private
  def __fsck_cache__(method)
    @_fsck_method_name_cache ||= {}
    
    return @_fsck_method_name_cache[method] if @_fsck_method_name_cache[method]
    
    words = method.to_s.delete("!?=").split("_").map { |w| Regexp.escape(w) }
    @_fsck_method_name_cache[method] = "(\\w*_)?#{words.join('\w*_\w*')}(_\\w*)?"
  end
end
