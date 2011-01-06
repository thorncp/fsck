module Fsck
  def method_missing(sym, *args, &block)
    method = sym.to_s
    if punctuation = sym[/[!?=]$/]
      method.chop!
    end
    
    matches = methods.select do |m|
      words = m.to_s.delete("!?=").split("_").map { |w| Regexp.escape(w) }
      method =~ /^(\w*_)?#{words.join('\w*_\w*')}(_\w*)?#{punctuation}$/
    end

    if matches.empty?
      super
    else
      send(matches.sort_by(&:length).last, *args, &block)
    end
  end
end
