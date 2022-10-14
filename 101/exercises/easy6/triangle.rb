def triangle(levels)
  spaces = 
  bricks = 1
  until levels == 0
    puts ' ' * (levels - 1) + '*' * (bricks)
    levels -= 1
    bricks += 1
  end
end

triangle(9)