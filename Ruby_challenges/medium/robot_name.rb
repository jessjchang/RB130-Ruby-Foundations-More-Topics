=begin
Task: Manage robot factory settings
Rules:
  -first time robot is created, random name is generated
  -when reset robot to factory settings, name gets deleted, and new random name is generated next time we ask for name
  -names must be random - no predictable sequence
  -don't allow for same name twice 
  -format of name is 2 uppercase letters, followed by 3 numeric digits

Examples/Test Cases:
  -define `Robot` class
  -define `name` instance method  - i.e. getter method
    -returns the name of the `Robot` object
    -name has to remain for the same `Robot` object until we change it
    -different `Robot` objects should have different names
    -if a given name is already taken, should generate another name for the new `Robot` object
  -define `reset` instance method
    -resets name to a different name
    -new name still has to follow naming convention

Data structures:
  -string
  -array

Algorithm:
-initialize class variable `@@names` to empty array

**`name` getter method:**
  -returns `@name` if it's not nil
  -generate a new name - use `generate_name` helper method - store in `@name`
  -if `@name` is already included in `@@names`, generate a new name until it's one that's not included
  -append the new name into `@@names`
  -returns `@name` instance variable

**`reset` method:**
  -delete current `@name` from `@@names`
  -reassign `@name` to nil

*`generate_name` helper method:*
  -initialize empty string `new_name`
  -iterate twice
    -choose a random letter from A-Z and append into `new_name`
  -iterate three times
    -choose a random digit 0-9 and append into `new_name`
  -return `new_name`
=end

class Robot
  @@names = []

  def name
    return @name if @name
    @name = generate_name
    until !@@names.include?(@name)
      @name = generate_name
    end
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    new_name = ''
    2.times { new_name << ('A'..'Z').to_a.sample }
    3.times { new_name << rand(0..9).to_s }
    new_name
  end
end
