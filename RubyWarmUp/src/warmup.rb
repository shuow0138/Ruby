def fib(n)
    arr=[]
   # if n == 0 then
        
   # else 
   if n != 0 then
        i = 0
        firstNum = 0 
        secondNum = 1
        
        while i < n
            if i == 0 then
                arr[i] = firstNum
            elsif i == 1 then 
                arr[i] = secondNum
            else 
                arr[i] = firstNum + secondNum 
                temp = firstNum 
                firstNum = secondNum 
                secondNum = temp + firstNum 
            end
         i = i + 1
        end
    end
   return arr
end

def isPalindrome(n)
    i = 0
    arr = []
    if n < 0 then
        return false 
    else 
        while n >= 1
            arr[i] = n % 10
            p arr 
            n = n / 10
         i = i + 1
      
        end
            #arr[i] = n
            #puts arr
            j = 0
            ans = true

        while j < arr.size / 2
            if arr[j] != arr[arr.size - 1 - j] then 
                 ans = false
            end
             j = j + 1    
        end 
        return ans
    end 
end

def nthmax(n, a)
   if a.empty? then 
       return nil
   end

    if n>a.length-1 then
       return nil
    else 
        a.sort!
       return a[a.length - 1 - n]
    end 
end

def freq(s)
    keys = ""
    hash = {}
    if s.empty? then
        return keys
    else 
        i = 0
        while i < s.length 
            if hash.has_key?(s[i]) then 
                hash[s[i]]= hash[s[i]] + 1
            else   
                hash[s[i]] = 1
            end 
         i = i + 1
        end  
        max_value = hash.values.max
        keys = hash.key(max_value)
        return keys
    end  
end


def zipHash(arr1, arr2)
    hash = {}
    if arr1.empty? && arr2.empty?  then 
         return hash
    else 
        if arr1.empty? || arr2.empty? || arr1.length != arr2.length then
            return nil
        else 
            i = 0
            while i < arr1.length
             hash[arr1[i]] = arr2[i]
                i = i + 1
            end   
            return hash
        end 
    end 
    
end

def hashToArray(hash)
    if hash.empty? then
        arr = []
        return arr
    end

    arr = Array.new(hash.length) {Array.new(1)}

    i = 0
    hash.each do |key|
    arr[i] = key
   # arr[i][1] = hash[key]
    i += 1
   end
    #while i < hash.length
     #arr[i][0] = hash.keys[i]
     #arr[i][1] = hash.values[i]
     #i = i +1
    #end
   
    return arr
end
