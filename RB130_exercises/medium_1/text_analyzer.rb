class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read) if block_given?
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines"  }
analyzer.process { |text| puts "#{text.split.size} words" }

# 3 paragraphs
# 15 lines
# 126 words