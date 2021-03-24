ENCRYPTED = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'
].freeze

def decipher_rot13(arr)
  arr.each do |name|
    deciphered_name = name.chars.map do |char|
                        decrypted_char = decipher_letter(char.downcase)
                        upcase?(char) ? decrypted_char.upcase : decrypted_char
                      end.join
    puts deciphered_name
  end
end

def decipher_letter(char)
  case char
  when 'a'..'m' then (char.ord + 13).chr
  when 'n'..'z' then (char.ord - 13).chr
  else char
  end
end

def upcase?(char)
  char.upcase == char
end

decipher_rot13(ENCRYPTED)


# Further Exploration

ENCRYPTED = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'
].freeze

def decipher_rot13(arr)
  arr.each do |name|
    deciphered_name = name.chars.map do |char|
                        decrypted_char = decipher_letter(char.downcase)
                        upcase?(char) ? decrypted_char.upcase : decrypted_char
                      end.join
    puts deciphered_name
  end
end

def decipher_letter(char)
  alpha = ('a'..'z').to_a
  case char
  when 'a'..'m' then alpha[alpha.index(char) + 13]
  when 'n'..'z' then alpha[alpha.index(char) - 13]
  else char
  end
end

def upcase?(char)
  char.upcase == char
end

decipher_rot13(ENCRYPTED)