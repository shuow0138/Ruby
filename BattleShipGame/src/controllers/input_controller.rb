require_relative '../models/game_board'
require_relative '../models/ship'
require_relative '../models/position'

# return a populated GameBoard or nil
# Return nil on any error (validation error or file opening error)
# If 5 valid ships added, return GameBoard; return nil otherwise
def read_ships_file(path)
    #GameBoard.new 10, 10
    if read_file_lines(path) then 
        @gameboard = GameBoard.new 10, 10
        count = 0
        read_file_lines(path) { |x|
        if x =~ /^\((\d+),(\d+)\),\s(\w+),\s([1-5])$/ then 
            posi = Position.new($1.to_i, $2.to_i)
            ship = Ship.new(posi, $3, $4.to_i)
            if @gameboard.add_ship(ship) then
              count += 1
         end 
            if count == 5 then 
                
                return @gameboard
            end     
        end  
        }
        return nil
    else    
        return nil
    end 
end


# return Array of Position or nil
# Returns nil on file open error
def read_attacks_file(path)
   # [Position.new(1, 1)]
   if read_file_lines(path) then 
   arr = []
    read_file_lines(path) { |x|
        if x =~ /^\((\d+),(\d+)\)$/ then 
            posi = Position.new($1.to_i, $2.to_i)
            #printf "(%s,%s)", $1, $2
            arr.push(posi)
        end  
    }
        return arr
    else 
        return nil
    end 
end


# ===========================================
# =====DON'T modify the following code=======
# ===========================================
# Use this code for reading files
# Pass a code block that would accept a file line
# and does something with it
# Returns True on successfully opening the file
# Returns False if file doesn't exist
def read_file_lines(path)
    return false unless File.exist? path
    if block_given?
        File.open(path).each do |line|
            yield line
        end
    end

    true
end
