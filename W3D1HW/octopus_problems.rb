def sluggish_octopus(fish)
    longest = ""

    fish.each do |ele1|    
        fish.each do |ele2|
            if ele2.length > ele1.length
                longest = ele2
            else
                longest = ele1
            end
        end
    end

    longest
end

def dominant_octupus(fish)
    arr = merge_sort(fish)
    arr[-1]
end

def clever_octopus(fish)
    longest = fish[0]
    fish.each do |ele|
        longest = ele if ele.length > longest.length
    end

    longest
end

def merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1.length <=> num2.length } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 
  'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p sluggish_octopus(fish)
p dominant_octupus(fish)
p clever_octopus(fish)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile, tiles_array)
    tiles_array.each.with_index {|ele, i| return i if ele == tile}
end

tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}

def constant_dance(tile, tiles_hash)
    tiles_hash[tile]
end

puts
p slow_dance("up", tiles_array)
p constant_dance("right-down", tiles_hash)
