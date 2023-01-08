=begin
  Problem:
    Robot name should be randomly generated
    Name's cant overlap (keep a log of past names)
    First time a robot is booted up, it generates a random name
    If the robot is reset, it needs a new name generated
    Names must be random, can't follow a sequence
    Name should be 2 uppercase chars, followed by 3 digits

  Data Structure:

  Use a class variable with a collection to store past names
  Names will be a string

  Robot class

    constructor method, takes no arguments
      assigns a random name
    public getter method for name
    public reset method, which will reset the name
    private setter method for name
    private generate random name method
      keeps making new ones until it is not included in the list of names
      adds to the name log

  Algorithm:

    generate random name method
      Init a results string
      Add a random char twice
      Add a random digit 0-9 three times

    constructor method
      run reset method

    reset method
      loop
        create a new name
        break unless the name is used already
      
      assign the name to the instance variable
      add the name ot the log of used names
=end

