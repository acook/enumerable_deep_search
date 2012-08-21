require "enumerable_deep_search/version"

module EnumerableDeepSearch
  def search item
    research self, item
  end

  def research object, item
    if simple_research object, item then
      puts '--# objects match'
      object
    elsif object.respond_to? :keys then
      puts '-- keys'
      hash_research object, item
    elsif object.respond_to? :each then
      puts '-- each'
      array_research object, item
    elsif object.respond_to? :to_hash then
      puts '-- convert to hash'
      research object.to_hash, item
    elsif object.respond_to? :to_a then
      puts '-- convert to array'
      research object.to_a, item
    else
      puts "-- other: #{object.class}"
      other_research object, item
    end
  end

  def hash_research object, item
    puts '-- hash'
    match = nil
    if object.keys.include? item then
      puts '--# has key'
      match = {item => object[item]}
    else
      puts '-- not key'
      object.find do |key, value|
        match = research value, item
        break if match
      end
    end

    if match then
      puts "--# match: #{match}"
    else
      puts '-- no match'
    end
    match
  end

  def array_research object, item
    puts '-- array'
    match = nil
    object.find do |element|
      if element == item then
        puts '--# element match found'
        match = element
      elsif match = research(element, item) then
        puts '--# element research found'
      end
    end

    if match then
      puts "--# match found: #{match}"
    else
      puts '-- no match'
    end
    match
  end

  def simple_research object, item
    if object == item then
      puts '--# objects match'
      object
    elsif object.to_s == item.to_s then
      puts '--# objects strings match'
      object
    else
      puts '-- no match (simple)'
    end
  end

  def other_research object, item
    if object.to_s == item.to_s then
      puts '--# string match found'
      object
    elsif item.is_a?(Regexp) && object.to_s =~ item then
      puts '--# regex match found'
      object
    elsif object.to_s =~ /#{item.to_s}/ then
      puts '--# substring match found'
      object
    else
      puts "-- no match (#{object.class})"
    end
  end
end
