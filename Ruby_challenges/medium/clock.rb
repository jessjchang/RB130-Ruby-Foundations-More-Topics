=begin
Task: create clock independent of date
Rules:
  -can add minutes to and subtract minutes from time represented by clock object
  -two clock objects with same time should be considered equal
  -60 minutes in an hour

Examples/Test Cases:
  -define `Clock` class
  -define `at` class method
    -takes one or two arguments (integers - first argument is hour, second argument is minutes)
    -returns time as a string in format 'hh:mm'
    -if pass in 0 for hour, this is '24:00'
    -if pass in 24 for hour, this is '00:00'
  -define `+` method
    -takes one argument (integer representing minutes)
    -returns new time as a string with the minutes added in
  -define `-` method
    -takes one argument (integer representing minutes)
    -returns new time as a string with the minutes subtracted
  -define `==` method
    -if compare two clock objects with same time, these are equal

Data structures:
  -strings
  -integers

Algorithm:
  ***define `Clock` class***

  **`hour` and `minutes` getter methods:** - keep protected

  **`initialize` method:** - takes two integer arguments `hour` and `minutes`
    -initialize `@hour` and `@minutes` instance variables to the arguments passed in

  **`at` class method:** - takes one or two arguments (integers `hour` and `minutes` - `minutes` defaults to 0)
    -reassign `hour` in situations of midnight:
      -call `adjust_for_hour` helper method
    -instantiate new `Clock` object and pass in `hour` and `minutes` to `::new` class method

  **`to_s` instance method:**
    -returns formatted string with `@hour` and `@minutes`

  **`==` instance method:** - takes other `Clock` object as argument
    -check if `@hour` and `@minutes` are the same (i.e. use `Integer#==`) between the two clock objects

  **`+` instance method:** - takes in integer argument `add_minutes`
    -initialize constants `HOURS_PER_DAY`, `MINUTES_PER_HOUR`
    -call `divmod` on `add_minutes`, passing in `MINUTES_PER_DAY` as argument - store in local variables `days` and `total_minutes`
    -call `divmod` on `total_minutes`, passing in `MINUTES_PER_HOUR` as argument - store in local variables `hours_to_add` and `minutes_to_add`
    -add `minutes_to_add` to `@minutes` - if result is greater than `MINUTES_PER_HOUR`, then take `divmod` of result, and add `extra_hour` to `@hour` and `@minutes` will be the remainder
    -add `hours_to_add` to `@hour` - call `adjust_for_hour` helper method
    -returns calling `Clock` object

  *`adjust_for_hour` helper method:
      -if `@hour` is 24, then return 0
      -if `@hour` is 0, then return 24
      -if `@hour` > 24, return `hour` - 24
      -if `@hour` < 0, return `hour` + 24

  **`-` instance method:** - takes in integer argument `subtract_minutes`
    -invoke `+` instance method and pass in negative `subtract_minutes` as argument
=end

class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes=0)
    clock = new(hour, minutes)
    clock.adjust_for_hour
    clock
  end

  def to_s
    format('%02d:%02d', hour, minutes)
  end

  def ==(other_clock)
    hour == other_clock.hour && minutes == other_clock.minutes
  end

  def +(add_minutes)
    _days, total_minutes = add_minutes.divmod(MINUTES_PER_DAY)
    hours_to_add, minutes_to_add = total_minutes.divmod(MINUTES_PER_HOUR)
    @minutes += minutes_to_add
    adjust_for_minutes
    @hour += hours_to_add
    adjust_for_hour
    self
  end

  def -(subtract_minutes)
    self.+(-subtract_minutes)
  end

  def adjust_for_hour
    if @hour == HOURS_PER_DAY
      @hour = 0
    elsif @hour == 0
      @hour = HOURS_PER_DAY
    elsif @hour > HOURS_PER_DAY
      @hour -= HOURS_PER_DAY
    elsif @hour < 0
      @hour += HOURS_PER_DAY
    end
  end

  protected

  attr_reader :hour, :minutes

  private

  def adjust_for_minutes
    return unless @minutes > MINUTES_PER_HOUR
    extra_hour, @minutes = @minutes.divmod(MINUTES_PER_HOUR)
    @hour += extra_hour
  end
end

# SOLUTION 2
class Clock
  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def initialize(total_minutes)
    @total_minutes = 0
    adjust_time(total_minutes)
  end

  def self.at(hour, minutes=0)
    total_minutes = calc_total_minutes(hour, minutes)
    new(total_minutes)
  end

  def self.calc_total_minutes(hour, minutes)
    (hour * MINUTES_PER_HOUR) + minutes
  end

  def to_s
    format('%02d:%02d', hour, minutes)
  end

  def ==(other_clock)
    hour == other_clock.hour && minutes == other_clock.minutes
  end

  def +(add_minutes)
    adjust_time(add_minutes)
    self
  end

  def -(subtract_minutes)
    adjust_time(-subtract_minutes)
    self
  end

  protected

  attr_reader :hour, :minutes

  private

  def adjust_time(minutes)
    @total_minutes += minutes
    _total_days, remaining_minutes = @total_minutes.divmod(MINUTES_PER_DAY)
    @hour, @minutes = remaining_minutes.divmod(MINUTES_PER_HOUR)
  end
end
