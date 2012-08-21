require_relative 'enumerable_deep_search/version'

module EnumerableDeepSearch
  def search item
    research self, item
  end

  def out *args
    puts "-- #{args.join(' ')}" if $VERBOSE || $DEBUG
  end

  def research object, item
    if simple_research object, item then
      out '# simple objects match'
      object
    elsif object.respond_to? :keys then
      out 'keys'
      hash_research object, item
    elsif object.respond_to? :each then
      out 'each'
      array_research object, item
    elsif object.respond_to? :to_hash then
      out 'convert to hash'
      research object.to_hash, item
    elsif object.respond_to? :to_a then
      out 'convert to array'
      research object.to_a, item
    else
      out 'other:', object.class
      other_research object, item
    end
  end

  def hash_research object, item
    out 'hash'

    match = nil
    object.find do |key, value|
      match = research key, item
      if match then
        out '# match found (hash key):', key
        match = {match => value}
      else
        out 'no match (hash key):', key
        match = research value, item
        match = {key => match} if match
      end
    end

    if match then
      out '# match:', match
    else
      out 'no match'
    end
    match
  end

  def array_research object, item
    out 'array'
    match = nil
    object.each_with_index do |element, index|
      match = research(element, item)
      if match then
        match = [index, match]
      end
    end

    if match then
      out '# match found:', match
    else
      out 'no match'
    end
    match
  end

  def simple_research object, item
    if object == item then
      out '# objects match'
      object
    elsif object.to_s == item.to_s then
      out '# object strings match'
      object
    end
  end

  def other_research object, item
    if simple_research object, item then
      out '# simple match found'
      object
    elsif item.is_a?(Regexp) && object.to_s =~ item then
      out '# regex match found'
      object
    elsif object.to_s =~ /#{item.to_s}/ then
      out '# substring match found'
      object
    else
      out 'no match:', object.class
    end
  end
end
