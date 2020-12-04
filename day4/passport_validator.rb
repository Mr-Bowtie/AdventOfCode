PASSPORT_FIELDS = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]

def parse_batch_file(file)
  batch_file = File.open(file)
  batch_data = batch_file.read

  batch_array = batch_data.split(/\n\n/).map { |passport| passport.split }

  batch_array.each do |batch_element|
    index = batch_array.index(batch_element)
    batch_array[index] = batch_element.map { |passport_field| passport_field.split(":") }.to_h
  end
end

def vaild_passport?(passport)
end
