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
        encrypt_message = ""
        hash = {
            message: encrypt_message,
            key: key,
            date: date
        }
        counter = 0
        message.each_char do |ele|
            if @alphabet.include?(ele)
                encrypted_letter = message_encryption(ele, final_shifts[counter])
                encrypt_message << encrypted_letter
                counter += 1
            else
                encrypt_message << ele
                counter += 1
            end
            counter = 0 if counter > 3
        end
        hash
    end

    def message_encryption(letter, shift)
        alphabet = @alphabet.clone
        letter_index = @alphabet.find_index(letter) + 1
        alphabet.shift(letter_index)
        outliers = alphabet.length

        if shift == 27
            final_letter = letter
        elsif shift > 27
            shift_total = (shift - outliers).abs
            final_shift = shift_total % 27
            final_letter = @alphabet[final_shift - 1]
        elsif shift > outliers
            shift_total = (shift - outliers).abs
            final_letter = @alphabet[shift_total - 1]
        else
            shift_total = letter_index + shift
            final_letter = @alphabet[shift_total - 1]
        end
        final_letter
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
        shifts = []
        final_shifts = {}
        final_shifts[:A] = (key[0..1].to_i + offsets[0].to_i)
        final_shifts[:B] = (key[1..2].to_i + offsets[1].to_i)
        final_shifts[:C] = (key[2..3].to_i + offsets[2].to_i)
        final_shifts[:D] = (key[3..4].to_i + offsets[3].to_i)
        final_shifts.each do |key,value| 
            shifts << value
        end
        shifts
    end
end 