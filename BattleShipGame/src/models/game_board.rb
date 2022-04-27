class GameBoard
    attr_reader :max_row, :max_column

    def initialize(max_row, max_column)
        @max_row = max_row
        @max_column = max_column
        @gameboard = Array.new(max_column + 1){Array.new(max_row + 1){Array.new(2,nil)}}
        @successAttackCount = 0
    end

    # adds a Ship object to the GameBoard
    # returns Boolean
    # Returns true on successfully added the ship, false otherwise
    # Note that Position pair starts from 1 to max_row/max_column
    def add_ship(ship)
        #p @gameboard
        ans = false 
        if @gameboard != nil && 
            @gameboard[ship.start_position.column][ship.start_position.row] != nil  &&
            ship.start_position.column <= @max_column && ship.start_position.row <= @max_row then #&& then
            #(@gameboard[ship.start_position.column][ship.start_position.row][0] != "B") then #nil  11 
                
            if ship.orientation.eql?("Up") then 
                #chech if it is out of boundary
                if ship.start_position.row - ship.size >= 0 then
                    #check if there is overlap
                    i = 0
                    while i < ship.size
                       if @gameboard[ship.start_position.column][ship.start_position.row - i][0]=="B" then 
                            ans= false
                       end 
                       i += 1 
                    end 
                    #Insert the ship to the gameboard
                    ans = true
                        i = 0
                        while i < ship.size
                            @gameboard[ship.start_position.column][ship.start_position.row - i][0] = "B" 
                            i += 1
                        end 
                     
                else 
                    return false 
                end 
            elsif ship.orientation.eql?("Down") then 
                #chech if it is out of boundary
                if ship.start_position.row + ship.size <= @max_row + 1 then
                    #check if there is overlap
                    i = 0
                    while i < ship.size
                       if @gameboard[ship.start_position.column][ship.start_position.row + i][0] == "B" then 
                            ans =  false
                       end 
                       i += 1 
                    end 
                    #Insert the ship to the gameboard
                    ans = true
                        i = 0
                        while i < ship.size
                            @gameboard[ship.start_position.column][ship.start_position.row + i][0] = "B" 
                             i += 1
                        end 
                   
                else  
                    return false
                end 
            elsif ship.orientation.eql?("Left") then
                #chech if it is out of boundary
               
                if ship.start_position.column - ship.size >= 0 then
                    #check if there is overlap
                    i = 0
                    while i < ship.size
                       if @gameboard[ship.start_position.column - i][ship.start_position.row][0] == "B" then 
                            ans = false 
                       end 
                       i += 1 
                    end 
                    #Insert the ship to the gameboard
                    ans = true
                      
                    i = 0
                    while i < ship.size
                        @gameboard[ship.start_position.column - i][ship.start_position.row][0] = "B"
                        i += 1
                    end 
                
                else 
                    return false 
                end 
            elsif ship.orientation.eql?("Right") then 
                
                if ship.start_position.column + ship.size <= @max_column + 1 then
                    #p @gameboard.to_s
                    
                    i = 0
                    while i < ship.size
                       if @gameboard[ship.start_position.column + i][ship.start_position.row][0] != nil then 
                           #return false
                           ans = false 
                       end 
                       i += 1 
                    end 
                    ans =  true
                    j = 0
                    while j < ship.size
                        @gameboard[ship.start_position.column + j][ship.start_position.row][0] = "B"
                        j += 1
                    end 
                else 
                    return false 
                end 
            else 
                return false 
            end
            return true 
        else 
            return false 
        end  
        return ans  
    end
    
    # return Boolean on whether attack was successful or not (hit a ship?)
    # return nil if Position is invalid (out of the boundary defined)
    def attack_pos(position)
        # check position
        if position.row > @max_row || position.column > @max_column then 
            return nil
        end 
        # update your grid
        @gameboard[position.column][position.row][1] = "A"
        # return whether the attack was successful or not
        if @gameboard[position.column][position.row][0] == "B" then 
            @successAttackCount += 1     
            return true
        else     
            return false
        end 
    end

    # Number of successful attacks made by the "opponent" on this player GameBoard
    def num_successful_attacks
        return @successAttackCount
    end

    # returns Boolean
    # returns True if all the ships are sunk.
    # Return false if at least one ship hasn't sunk.
    def all_sunk?
        i = 1 
        while i <= @max_row
            j = 1
            while j <= @max_column  
                if @gameboard[j][i][0] == "B" then
                    if @gameboard[j][i][1] != "A" then
                        return false 
                    end
                end 
                j+=1
            end 
            i+=1
        end 
        return true
    end


    # String representation of GameBoard (optional but recommended)
    def to_s
        i = 1 
        while i<= @max_row
            j = 1
            while j <= @max_column
                k = 0
                while k < 2 
                    if @gameboard[j][i][k] == "A" then
                        printf "A"
                    elsif @gameboard[j][i][k] == "B" then
                        printf "B"
                    else 
                        printf "-"
                    end 
                    k += 1 
                end 
                printf "|"
                j+=1              
            end 
          printf "\n"
            i+=1           
        end 
    end
end