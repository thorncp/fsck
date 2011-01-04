module Fsck
  def method_missing(sym, *args, &block)
    matches = methods.select { |m| sym =~ /\w*#{m.to_s.split('_').join('\w+')}\w*/ }

    if matches.empty?
      super
    else
      send matches.first
    end
  end
end
