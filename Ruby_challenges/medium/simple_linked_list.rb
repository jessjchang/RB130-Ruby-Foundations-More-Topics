=begin
Task: implement linked list
Rules:
  -singly linked list
  -each element in the list contains data and a "next" field pointing to the next element in the list of elements
  -elements may contain range of data i.e. numbers 1-10
  -implement methods to reverse the linked list and convert linked list to and from an array

Examples/Test Cases:
  -define class `Element`
  -constructor:
    -takes 1 or 2 arguments (integers)
    -first argument is first to be stored in element - `@datum`
    -second argument is next element after the just created element - should have default value (nil?) if not given
  -define `datum` instance method 
    -returns `@datum`
  -define `tail?` instance method
    -return `true` if current element is last element in list with no other `Element` object stored as next
  -define `next` instance method
    -returns nil if no next element
    -returns next element in list

  -define class `SimpleLinkedList`
  -define `from_a` class method
    -takes 1 argument (array)
    -if argument is nil, list is considered empty
    -instantiate new `SimpleLinkedList` object with the given argument
  -constructor:
    -takes no arguments
    -store elements
  -define `size` instance method
    -returns size of current list (i.e. if list is empty, return 0)
  -define `empty?` instance method
    -returns `true` if list is empty, `false` otherwise
  -define `push` instance method
    -takes 1 argument (integer)
    -argument represents `@datum` of `Element` object that should be appended into list
  -define `head` instance method
    -return `Element` object
    -returns most recently added item in list
  -define `peek` instance method
    -returns nil if list is empty
    -returns datum of head element
  -define `reverse` instance method
    -returns list in reverse order (as array)
  -define `pop` instance method
    -permanently removes most recently added item from list
  -define `to_a` instance method
    -convert `SimpleLinkedList` object into array

Data structures:
  -arrays

Algorithm:
****`Element` class:****

**`initialize` method:** - takes one or 2 arguments (`current_data` and `next_data` - `next_data` has default of nil)
  -store `current_data` in `@datum`
  -initialize instance variable `@next` and assign to `next_data`  if `next_data` isn't nil

**`datum` instance method:**
  -returns value of `@datum`

**`tail?` instance method:**
  -return `true` if `@next` is nil

**`next` instance method:**
  -return `@next`


****`SimpleLinkedList` class:****

**`from_a` class method:** - takes one argument `arr`
  -if `arr` is nil, assign `arr` to empty array
  -instantiate new `SimpleLinkedList` object - `@elements` is empty array
  -iterate through arr in reverse - block parameter `data`
    -push new element with `data` into object
  -return the object

**`initialize` method:**
  -initialize `@elements` to empty array

**`size` instance method:**
  -return size of `@elements`

**`empty?` instance method:**
  -return `true` if `@elements` is empty, and `false` otherwise

**`push` instance method:** - takes one argument (`data`)
  -if list itself is empty
    -instantiate `Element` object where `@datum` is `data`
    -append new element to `@elements`
  -otherwise,
    -instantiate `Element` object where `@datum` is `data` and `@next` is the last element of `@elements`
    -append new element to `@elements`
  
**`head` instance method:**
  -return last element of `@elements`

**`peek` instance method:**
  -return nil if list is empty
  -return `@datum` of `head` element

**`to_a` instance method:**
  -iterates through `@elements` in reverse - block parameter `element`
    -append `@datum` of `element` to empty array
  -return resulting array

**`reverse` instance method:**
  -initialize local variable `elements` and assign to invoking `to_a` reversed
  -instantiate new `SimpleLinkedList` object passing in `elements` - use `from_a` class method

**`pop` instance method:**
  -remove last element from `@elements` and return `@datum` of removed element
=end

class Element
  attr_reader :datum, :next

  def initialize(current_data, next_element=nil)
    @datum = current_data
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def self.from_a(arr)
    arr = [] if arr.nil?
    list = SimpleLinkedList.new
    arr.reverse.each { |data| list.push(data) }
    list
  end

  def initialize
    @elements = []
  end

  def size
    @elements.size
  end

  def empty?
    @elements.empty?
  end

  def push(data)
    if empty?
      @elements << Element.new(data)
    else
      @elements << Element.new(data, @elements.last)
    end
  end

  def head
    @elements.last
  end

  def peek
    return nil if empty?
    head.datum
  end

  def to_a
    @elements.reverse.each_with_object([]) do |element, result|
      result << element.datum
    end
  end

  def reverse
    elements = to_a.reverse
    SimpleLinkedList.from_a(elements)
  end

  def pop
    removed = @elements.pop
    removed.datum
  end
end
