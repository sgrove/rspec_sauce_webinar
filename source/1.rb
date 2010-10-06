describe "Math class" do
  context "Addition method" do
    before(:all) do
      puts "I'm being run before anything else - but only once!"
    end

    before(:each) do
      puts "I'm being run before each tests - once for each test!"
    end

    it "increases a number on addition" do
      value = 2
      delta = 2
      value += delta
      value.should eql(10)
    end

    it "should leave a number the same if 0 is added" do
      value = 2
      delta = 0
      value += delta
      value.should eql(0)
    end
  end
end
