require 'rspec'

class Linebreaker
  def self.break line, breakpoint
    return "" if line.nil?
    splitup(line, breakpoint)
  end

  def self.splitup(line, breakpoint)
    parts = line.scan(/.{#{breakpoint}}|.+/).map{|p| p.strip}
    parts.join '\n'
  end
end

describe "Linebreaker", "A routine to break lines" do it "handles nil content" do expect(Linebreaker.break nil, 1 ).to eq "" end

  it "handles an empty line" do
    expect(Linebreaker.break "", 1 ).to eq ""
  end

  it "handles a single character line" do
    expect(Linebreaker.break "a", 1).to eq "a"
  end

  it "handles a line with 2 characters" do
    expect(Linebreaker.break "ab", 1).to eq 'a\nb'
  end

  it "handles a line with 3 characters" do
    expect(Linebreaker.break "abc", 2).to eq 'ab\nc'
  end

  it "handles words" do
    expect(Linebreaker.break "four score", 5).to eq 'four\nscore'
  end
end
