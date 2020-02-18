class Verify
  def self.at_least_one_attribute_contains_keyword(item, keyword)
    if item.values.all? { |x| !x.downcase.include? keyword }
      puts "FAILED: Keyword '#{keyword}' NOT found in attributes of freelancer '#{item[:name]}'"
    else
      puts "PASSED: Keyword '#{keyword}' found in attributes of freelancer '#{item[:name]}'"
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

  def self.attributes_match(search, profile)
    profile.each do |k1, v1|
      search.each do |k2, v2|
        if k1 == k2
        case k1
        when :skills
          v1.split(', ').each do |x|
            if v2.include? x
              puts "PASSED: Skill '#{x}' found in profile"
            else
              "PASSED: Skill '#{x}' NOT found in profile"
            end
          end
        else
          if v1.include? v2
             puts "PASSED Attribute '#{k1}': '#{v1}' found in profile '#{v2}' "
           else
             puts "FAILED Attribute '#{k1}':'#{v1}' NOT found in profile '#{v2}'"
          end
        end
        end
  end
  end
  end
end