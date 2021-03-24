=begin
Task: construct objects that represent meetup date
Rules:
  -meetups happen same day of the week every month
    -e.g.:
      -The first Monday of January 2021
      -The third Tuesday of December 2020
      -The teenth wednesday of December 2020
      -The last Thursday of January 2021
  -Each object takes a month number (1-12) and a year (e.g., 2021).
  -object can determine exact date of the meeting in specified month and year
    -e.g. if you ask for the 2nd Wednesday of May 2021, determine meetup for that month will occur on the 12th of May, 2021.
  -descriptors given as strings:
    -'first', 'second', 'third', 'fourth', 'fifth', 'last', and 'teenth'
    -case insensitive i.e. 'first' and 'fIrSt' are equivalent
    -every month has exactly one "teenth" Monday, one "teenth" Tuesday, etc. 
    -fifth day of the month may not happen every month
  -days of the week given as strings
    -'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', and 'Sunday'
    -case insensitive

Examples/Test Cases:
  -define `Meetup` class
  -constructor takes 2 arguments (integers representing year and month)
  -define `day` instance method
    -takes two arguments (strings representing day of week and descriptor)
    -should return `Date` object with year, month, day (integers)
    -return `nil` if invalid meetup specifications (i.e. fifth day of month in some cases)

Data structures:
  -integers
  -strings
  -`Date` objects

Brainstorm:
-`TEENTH` constant - 13, 14, 15, 16, 17, 18, 19 - `teenth?` returns `true` if day is a teenth
-Date.civil(2013, 3, 4).strftime('%A') would return day of week (e.g. 'Monday') - account for case when comparing
-iterate through from 1st to last day of month (-1) - call `day` on `Date` object to return specific date
-if given 'last' as descriptor, iterate through from last day of month to 1st to find
-set counter to determine how many times you've seen the day of the week

Algorithm:
**`initialize` method:** - takes 2 arguments, integers `year` and `month`
  -initialize `@year` and `@month` instance variables and assign to arguments

**`day` instance method:** - takes 2 arguments, strings `day_of_week` and `descriptor`
  -initialize constant `TEENTH` to array containing integers 13-19
  -initialize constant `DESCRIPTOR_NUM_TIMES` to hash where key is descriptor ('first' to 'fifth') and value is the corresponding number of times (i.e. 1-5)
  -reassign `day_of_week` to downcased version
  -reassign `descriptor` to capitalized version
  -check `descriptor`:
    -if 'last', then invoke `find_last` helper method
    -if 'teenth', invoke `find_teenth` helper method
    -otherwise, invoke `find_numth` helper method

*`find_last` helper method:* - takes `day_of_week` as argument
  -initialize local variable `date` to a new `Date` object with `@year`, `@month`, and day starting from -1 (last day of the month)
  -loop:  
    -break if day of week of `date` is equivalent to `day_of_week`
    -otherwise, reassign `date` to previous day
  -return `date`

*`find_teenth` helper method:* - takes `day_of_week` as argument
  -initialize `date` to nil
  -iterate through `TEENTH` array
    -on each iteration - block parameter `day`
      -reassign local variable `date` to a new `Date` object with `@year`, `@month`, and day represented by `day`
      -check if day of week is same as `day_of_week` 
        -if so, return `date`
        -otherwise, move onto next iteration

*`find_numth` helper method:* - takes `day_of_week` and `descriptor` as arguments
  -initialize local variable `date` to a new `Date` object with `@year`, `@month`, and day starting from 1
  -loop:
    -break if day of week of `date` is equivalent to `day_of_week`
    -otherwise, reassign `date` to the next day
  -find corresponding value of `descriptor` in `DESCRIPTOR_NUM_TIMES` and subtract one
  -iterate the above result number of times:
    -reassign `date` to the next week
  -return `date` unless month of `date` is not equal to `@month`
  -in that case, return nil
=end

# require 'date'

class Meetup
  TEENTH = (13..19).to_a.freeze
  DESCRIPTOR_NUM_TIMES = {
    'first' => 1,
    'second' => 2,
    'third' => 3,
    'fourth' => 4,
    'fifth' => 5
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_week, descriptor)
    day_of_week = day_of_week.capitalize
    descriptor = descriptor.downcase
    case descriptor
    when 'last' then find_last(day_of_week)
    when 'teenth' then find_teenth(day_of_week)
    else find_numth(day_of_week, descriptor)
    end
  end

  private

  def find_last(day_of_week)
    date = Date.civil(@year, @month, -1)
    until found_day?(date, day_of_week)
      date = date.prev_day
    end
    date
  end

  def find_teenth(day_of_week)
    date = nil
    TEENTH.each do |day|
      date = Date.civil(@year, @month, day)
      return date if found_day?(date, day_of_week)
    end
  end

  def find_numth(day_of_week, descriptor)
    date = Date.civil(@year, @month, 1)
    until found_day?(date, day_of_week)
      date = date.next
    end
    (DESCRIPTOR_NUM_TIMES[descriptor] - 1).times { date += 7 }
    return date unless date.mon != @month
    nil
  end

  def found_day?(date, day_of_week)
    date.strftime('%A') == day_of_week
  end
end
