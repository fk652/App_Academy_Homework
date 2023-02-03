def sluggish_octopus(fish_arr)
  (0..fish_arr.length-1).each do |idx|
      fish_1 = fish_arr[idx]
      return fish_1 if fish_arr.none? { |fish_2| fish_2.length > fish_1.length }
  end
end

def dominant_octupus(fish_arr)
  fish_arr.sort { |a, b| a.length <=> b.length }[-1]
end

def clever_octupus(fish_arr)
  longest = ''
  fish_arr.each { |fish| longest = (fish.length > longest.length ? fish : longest) }
  longest
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 
'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(fish)
p dominant_octupus(fish)
p clever_octupus(fish)



tiles_array = ["up", "right-up", "right", "right-down", "down", 
"left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  (0..tiles_array.length-1).each do |idx|
    return idx if tiles_array[idx] == direction
  end
  nil
end

p slow_dance("up", tiles_array) # => 0
p slow_dance("right-down", tiles_array) # => 3

tiles_hash = {
  "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, 
  "down" => 4, "left-down" => 5, "left" => 6,  "left-up"=> 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

p fast_dance("up", tiles_hash) # => 0
p fast_dance("right-down", tiles_hash) # => 3