class Verify
  def self.at_least_one_attribute_contains_keyword(item, keyword)
    if item.values.all? { |x| !x.downcase.include? keyword }
      puts "FAILED: Keyword '#{keyword}' NOT found in search results for freelancer '#{item[:name]}'"
    end
  end

  def self.each_attribute_contains_keyword(item, keyword)
    item.each do |k, v|
      if v.downcase.include? keyword
        puts "PASSED: Keyword '#{keyword}' found in attribute '#{k}'. Actual: '#{v}'"
      else
        puts "FAILED: Keyword '#{keyword}' NOT found in attribute '#{k}'. Actual '#{v}'"
      end
    end
  end
end