module Fsck
  def method_missing(sym, *args, &block)
    matches = methods.select do |m|
      words = m.to_s.split("_").map { |w| Regexp.escape(w) }
      sym =~ /\w*#{words.join('\w+')}\w*/
    end

    if matches.empty?
      super
    else
      send matches.first, *args, &block
    end
  end
end
