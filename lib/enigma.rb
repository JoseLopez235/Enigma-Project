require 'pry'

class Enigma
    attr_accessor :alphabet, :random_key, :date

    def initialize
        @alphabet = ("a".."z").to_a << " "
        @random_key = key_generator
        @date = todays_date

    end
    
    def encrypt(message,key=@random_key ,date=@date)
        hash = {
            message: message,
            key: key,
            date: date
        }
    end

    def decrypt
        return "goodbye"
    end

    def key_generator
        key = ""
        until key.length == 6
            random_number = rand(0..9)
            key += random_number.to_s
        end
        key
    end

    def todays_date
        time = Time.now.strftime("%m%d%Y")
        time.slice!(4)
        time.slice!(4)
        time
    end
end 