# your code goes here
def begins_with_r (arr)
  all_true = []
  arr.collect do |r|
    if r[0].downcase == 'r'
       all_true.push(true)
    else
      all_true.push(false)
    end
  end
  all_true.all? {|x| x == true}
end

def contain_a (arr)
  contains_a = []
  arr.collect do |a|
    if a.include?('a')
      contains_a.push(a)
    end
  end
  contains_a
end

def first_wa (arr)
  new_wa = nil
  arr.each do |wa|
    new_wa = wa.to_s
    if new_wa.include?('wa')
      return new_wa
    end
  end
end

def count_elements (arr)
  names = []
  count = []
  new_arr = []
  curr_name = nil
  curr_count = 0
  arr.each do |i|
    i.each do |x, name|
      if names.length == 0
        names.push(name)
        count.push(1)
      elsif names.include?(name)
        count[name.index(name)] += 1
      else
        names.push(name)
        count.push(1)
      end
    end
  end

  names.each_with_index do |name, i|
    new_arr.push(Hash[:name => name,:count => count[i]] )
  end
  new_arr
end

def merge_data (keys, data)
  data_arr = []
  names = []
  awesomeness = []
  height = []
  last_name = []

  keys.each do |key|
    key.each do |type, value|
      if !names.include?(value)
        names.push(value)
      end
    end
  end

  data.each do |first|
    curr_name = 0
    first.each do |cats, value|
      curr_name = names.index(cats)
      value.each do |x, y|
        if x.to_s == 'awesomeness'
          awesomeness[curr_name] = y
        elsif x.to_s == 'height'
          height[curr_name] = y
        elsif x.to_s == 'last_name'
          last_name[curr_name] = y
        end
      end
    end
  end

  names.each_with_index do |name, i|
    data_arr.push(Hash[:first_name => name, :awesomeness => awesomeness[i], :height => height[i], :last_name => last_name[i] ])
  end
  data_arr
end

def remove_non_strings (arr)
  strings = []
  arr.each do |i|
    if i.instance_of? String
      strings.push(i)
    end
  end
  strings
end

def find_cool (arr)
  those_that_are_cool = []
  cool_found = false
  arr.each do |x|
    x.each do |y, vals|
      if y.to_s == 'temperature'
        if vals.to_s == 'cool'
          those_that_are_cool.push(x)
        end
      end
    end
  end
  those_that_are_cool
end

def organize_schools (arr)

  schools =  []

  arr.each do |x|
    schools.push(x)
  end

  schools = arr.keys
  school_locations = []
  locations = []
  sch_lo = []

  arr.each do |x, y|
    y.each do |loc, place|
      school_locations.push(place)
    end
  end

  locations = school_locations.uniq

  locations.each_with_index do |x|
    sch_lo.push([])
  end

  school_locations.each_with_index do |school, i|
    curr_city = locations.index(school)
    sch_lo[curr_city].push(schools[i])
  end


  new_hash = {}

  locations.each_with_index do |city, i|
      new_hash[city] = sch_lo[i]
  end

  sch_lo

end
