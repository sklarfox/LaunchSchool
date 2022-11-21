class Banner
  def initialize(message, custom_width=(message.length))
    @message = message
    if custom_width >= message.length
      @width = custom_width
    else
      puts "Error: Custom width smaller than minimum. Using default width instead."
      sleep 2
      @width = message.length
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-#{'-' * @width}-+"
  end

  def empty_line
    "| #{' ' * @width} |"
  end

  def message_line
    "| #{@message.center(@width)} |"
  end
end

banner = Banner.new('To boldly go and such and such.', 80)
puts banner