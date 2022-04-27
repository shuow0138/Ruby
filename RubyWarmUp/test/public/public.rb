require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class PublicTests < MiniTest::Test
    def setup
        @phonebook = PhoneBook.new
    end

    def test_public_fib
        assert_equal([], fib(0))
        assert_equal([0], fib(1))
        assert_equal([0, 1], fib(2))
        assert_equal([0, 1, 1], fib(3))
        assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34], fib(10))
        assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377,], fib(15))
    end

    def test_public_ispalindrome
        assert_equal(true, isPalindrome(0))
        assert_equal(true, isPalindrome(1))
        assert_equal(false, isPalindrome(10))
        assert_equal(true, isPalindrome(101))
        assert_equal(false, isPalindrome(120210))
        assert_equal(false, isPalindrome(-120121))
        assert_equal(true, isPalindrome(1234321))
        assert_equal(true, isPalindrome(123321))
        assert_equal(true, isPalindrome(998899))
    end

    def test_public_nthmax
        assert_equal(3, nthmax(0, [1,2,3,0]))
        assert_equal(1, nthmax(0, [1]))
        assert_equal(4, nthmax(2, [3,4,5,7]))

        assert_nil(nthmax(3, [1,2,3]))
        assert_nil(nthmax(3, []))
        assert_equal(100, nthmax(0, [-10, 1,100,1]))
        assert_equal(1, nthmax(1, [-10, 1,100,1]))
        assert_equal(1, nthmax(2, [-10, 1,100,1]))
        assert_equal(-10, nthmax(3, [-10, 1,100,1]))

    end


    def test_public_freq
        assert_equal("", freq(""))
        assert_equal("@", freq("@"))
        assert_equal("a", freq("aaabb"))
        assert_equal("a", freq("bbaaa"))
        assert_equal("s", freq("ssabcd"))
        assert_equal("3", freq("112233333"))
        assert_equal("x", freq("a12xxxxxyyyxyxyxy"))
        assert_equal("x", freq("a12xxxxxXXXXXy"))
        assert_equal("x", freq("xxx?:%$@&*"))
    end

    def test_public_ziphash
        assert_equal({}, zipHash([], []))
        assert_equal({1 => 2}, zipHash([1], [2]))
        assert_equal({1 => 2, 5 => 4}, zipHash([1, 5], [2, 4]))
        assert_equal({"a" => 2, "b" => 4}, zipHash(["a", "b"], [2, 4]))
        assert_nil(zipHash([1], [2,3]))
        assert_nil(zipHash([1,2], [3]))
        assert_equal({"Mamat" => "prof", "Hicks" => "prof", "Vinnie" => "TA"},
                      zipHash(["Mamat", "Hicks", "Vinnie"], ["prof", "prof", "TA"]))
    end

    def test_public_hashtoarray
        assert_equal([], hashToArray({}))
        assert_equal([["a", "b"]], hashToArray({"a" => "b"}))
        assert_equal([["a", "b"], [1, 2]], hashToArray({"a" => "b", 1 => 2}))
        assert_equal([["a", "b"], [1, 2],["c", 2]], hashToArray({"a" => "b", 1 => 2, "c"=>2}))
        assert_equal([["x", "v"], ["y", "w"], ["z", "u"]], hashToArray({"x" => "v", "y" => "w", "z" => "u"}))
        assert_equal([["z", "v"], ["x", "w"], ["y", "u"]], hashToArray({"z" => "v", "x" => "w", "y" => "u"}))
        
    end

    def test_public_phonebook_add
        assert_equal(true, @phonebook.add("John", "110-192-1862", false))
        assert_equal(true, @phonebook.add("Jane", "220-134-1312", false))
       assert_equal(false, @phonebook.add("John", "110-192-1862", false))
    end

    def test_public_phonebook_lookup
        assert_equal(true, @phonebook.add("John", "110-192-1862", false))
        assert_equal(true, @phonebook.add("Jane", "220-134-1312", true))
        assert_equal(true, @phonebook.add("Jack", "114-192-1862", false))
        assert_equal(true, @phonebook.add("Jessie", "410-124-1131", true))
        assert_nil(@phonebook.lookup("John"))
        assert_nil(@phonebook.lookup("Jack"))
        assert_equal("220-134-1312", @phonebook.lookup("Jane"))
        assert_equal("410-124-1131", @phonebook.lookup("Jessie"))
    end

    def test_public_phonebook_lookup_by_num
        assert_equal(true, @phonebook.add("John", "110-192-1862", false))
        assert_equal(true, @phonebook.add("Jane", "220-134-1312", true))
        assert_equal(true, @phonebook.add("Jack", "114-192-1862", false))
        assert_equal(true, @phonebook.add("Jessie", "410-124-1131", true))
        assert_nil(@phonebook.lookupByNum("110-192-1862"))
        assert_nil(@phonebook.lookupByNum("114-192-1862"))
        assert_equal("Jane", @phonebook.lookupByNum("220-134-1312"))
        assert_equal("Jessie", @phonebook.lookupByNum("410-124-1131"))
    end

    def test_public_names_by_ac
        assert_equal(true, @phonebook.add("John", "110-192-1862", false))
        assert_equal(true, @phonebook.add("Jane", "110-134-1312", true))
        assert_equal(true, @phonebook.add("Jack", "114-192-1862", false))
        assert_equal(true, @phonebook.add("Jessie", "110-124-1131", true))
        assert_equal(["John", "Jane", "Jessie"].sort, @phonebook.namesByAc("110").sort)
        assert_equal(["Jack"], @phonebook.namesByAc("114"))
        assert_equal([], @phonebook.namesByAc("111"))
    end
end
