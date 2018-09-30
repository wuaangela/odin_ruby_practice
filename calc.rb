def grandfatherClock &block
    currentTime = Time.now.hour
    if currentTime > 12
        currentTime -= 12
    end

    puts "Printing #{currentTime}:"

    currentTime.times do
        block.call
    end
end

grandfatherClock do
    puts 'DONG' 
end