class PhoneBook
    def initialize
        @phone = {}
    end

    def add(name, number, is_listed)
        if @phone.has_key?(name) then 
            return false
        end

        i = 0
        while i < @phone.size
            if @phone.values[i].include?(number) then
                if @phone.values[i][1] && is_listed then
                    return false
                end
            end
            i = i +1
        end

        if number =~ /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/ then
            @phone[name] = []
            @phone[name][0] = number 
            @phone[name][1] = is_listed
            puts @phone
            return true
        else 
            return false 
        end 

    end

    def lookup(name)
        if @phone.has_key?(name) then
            
            if @phone[name][1] then
               # puts@phone[name].keys[0]
                return @phone[name][0]
            else 
                return nil
            end
        else 
            return nil
        end
    end

    def lookupByNum(number)
        i = 0
        while i < @phone.size
            if @phone.values[i].include?(number) then
                if @phone.values[i][1] then
                    arr = [number , true]
                    return @phone.key(arr)
                else 
                    return nil
                end
            end
            i = i +1
        end

    end

    def namesByAc(areacode)
        i = 0
        j = 0
        ans = []
        while i < @phone.size
           # puts @phone.values[i][0].slice(0, 3)
            if @phone.values[i][0].slice(0, 3) == areacode then
                #ans[j] = lookupByNum(@phone.values[i][0])  
                if @phone.values[i][1] then
                    arr = [ @phone.values[i][0], true]
                    ans[j] = @phone.key(arr)
                else 
                    arr = [@phone.values[i][0] , false]
                    ans[j] = @phone.key(arr)
                end
                j = j + 1
            end
            i = i +1
        end
        return ans
    end
end
