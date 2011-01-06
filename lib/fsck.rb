module Fsck
  def method_missing(sym, *args, &block)
    @_fsck_method_name_cache ||= {}
    
    return send(@_fsck_method_name_cache[sym], *args, &block) if @_fsck_method_name_cache[sym]
    
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
      @_fsck_method_name_cache[sym] = matches.sort_by(&:length).last
      send(@_fsck_method_name_cache[sym], *args, &block)
    end
  end
  
  private
  def __fsck_method_regex_str__(method)
    words = method.to_s.delete("!?=").split("_").map { |w| Regexp.escape(w) }
    "(\\w*_)?#{words.join('\w*_\w*')}(_\\w*)?"
  end
end
