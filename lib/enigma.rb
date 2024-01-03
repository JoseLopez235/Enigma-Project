require 'pry'

class Enigma
    attr_accessor :alphabet, :random_key, :date

    def initialize
        @alphabet = ("a".."z").to_a << " "
        @random_key = key_generator
        @date = todays_date

    end
    
    def encrypt(message,key=@random_key ,date=@date)
        final_shifts = shifts(key, date)
        binding.pry
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
        until key.length == 5
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

    def offset(date)
        num = date.to_i * date.to_i
        num.to_s.split("").pop(4)
    end

    def shifts(key,date)
        offsets = offset(date)
        final_shifts = {}
        final_shifts[:A] = (key[0..1].to_i + offsets[0].to_i)
        final_shifts[:B] = (key[1..2].to_i + offsets[1].to_i)
        final_shifts[:C] = (key[2..3].to_i + offsets[2].to_i)
        final_shifts[:D] = (key[3..4].to_i + offsets[3].to_i)
        final_shifts
    end
end 