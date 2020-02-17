class Verify
  def self.at_least_one_attribute_contains_keyword(item, keyword)
    if item.values.all? { |x| !x.downcase.include? keyword }
      puts "FAILED: results for #{item[:name]} do NOT contain #{keyword} in attributes at all"
    end
  end

  def self.each_attribute_contains_keyword(item, keyword)
    item.each do |k, v|
      if v.downcase.include? keyword
        puts "PASSED: #{item[:name]}'s attribute #{k}, '#{v}' contains #{keyword}"
      else
        puts "FAILED: #{item[:name]}'s attribute '#{v}' does NOT contain #{keyword}"
      end
    end
    end
end