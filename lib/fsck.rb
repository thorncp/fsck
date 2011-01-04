module Fsck
  def method_missing(sym, *args, &block)
    matches = methods.select do |m|
      words = m.to_s.split("_").map { |w| Regexp.escape(w) }
      sym =~ /^(\w*_)?#{words.join('\w*_\w*')}(_\w*)?$/
    end

    if matches.empty?
      super
    else
      method = matches.sort_by(&:length).last
      send method, *args, &block
    end
  end
end
