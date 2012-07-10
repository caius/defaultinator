require "defaultinator"

describe Defaultinator, "attributes defined in a class with no default" do
  before do
    @instance = Class.new do
      attr_accessor :attribute_1
      attr_accessor :attribute_2, :attribute_3
      attr_reader :attribute_4
      attr_reader :attribute_5, :attribute_6
    end.new
  end
  describe "attr_accessor" do
    it "should define the getters returning nil" do
      @instance.attribute_1.should be_nil
      @instance.attribute_2.should be_nil
      @instance.attribute_3.should be_nil
    end
    it "should define the setters" do
      @instance.attribute_1 = :foo
      @instance.attribute_1.should be == :foo
      @instance.attribute_2 = :foo
      @instance.attribute_2.should be == :foo
      @instance.attribute_3 = :foo
      @instance.attribute_3.should be == :foo
    end
  end
  describe "#attr_reader" do
    it "should define the getters returning nil" do
      @instance.attribute_4.should be_nil
      @instance.attribute_5.should be_nil
      @instance.attribute_6.should be_nil
    end
  end
end

describe Defaultinator, "attributes defined in a class with default" do
  before do
    @instance = Class.new do
      attr_accessor :attribute_1, default: []
      attr_accessor :attribute_2, :attribute_3, default: []
      attr_reader :attribute_4, default: false
      attr_reader :attribute_5, :attribute_6, default: false
    end.new
  end
  describe "#attr_accessor" do
    it "should define the getters returning default value" do
      @instance.attribute_1.should be == []
      @instance.attribute_2.should be == []
      @instance.attribute_3.should be == []
    end
    it "should define the setters" do
      @instance.attribute_1 = :foo
      @instance.attribute_1.should be == :foo
      @instance.attribute_2 = :foo
      @instance.attribute_2.should be == :foo
      @instance.attribute_3 = :foo
      @instance.attribute_3.should be == :foo
    end
  end
  describe "#attr_reader" do
    it "should define the getters returning default value" do
      @instance.attribute_4.should be_false
      @instance.attribute_5.should be_false
      @instance.attribute_6.should be_false
    end
  end
end

describe Defaultinator, "attributes defined in a module with no default" do
  before do
    mod = Module.new do
      attr_accessor :attribute_1
      attr_accessor :attribute_2, :attribute_3
      attr_reader :attribute_4
      attr_reader :attribute_5, :attribute_6
    end
    @instance = Class.new do
      include mod
    end.new
  end
  describe "attr_accessor" do
    it "should define the getters returning nil" do
      @instance.attribute_1.should be_nil
      @instance.attribute_2.should be_nil
      @instance.attribute_3.should be_nil
    end
    it "should define the setters" do
      @instance.attribute_1 = :foo
      @instance.attribute_1.should be == :foo
      @instance.attribute_2 = :foo
      @instance.attribute_2.should be == :foo
      @instance.attribute_3 = :foo
      @instance.attribute_3.should be == :foo
    end
  end
  describe "#attr_reader" do
    it "should define the getters returning nil" do
      @instance.attribute_4.should be_nil
      @instance.attribute_5.should be_nil
      @instance.attribute_6.should be_nil
    end
  end
end

describe Defaultinator, "attributes defined in a module with default" do
  before do
    mod = Module.new do
      attr_accessor :attribute_1, default: []
      attr_accessor :attribute_2, :attribute_3, default: []
      attr_reader :attribute_4, default: false
      attr_reader :attribute_5, :attribute_6, default: false
    end
    @instance = Class.new do
      include mod
    end.new
  end
  describe "#attr_accessor" do
    it "should define the getters returning default value" do
      @instance.attribute_1.should be == []
      @instance.attribute_2.should be == []
      @instance.attribute_3.should be == []
    end
    it "should define the setters" do
      @instance.attribute_1 = :foo
      @instance.attribute_1.should be == :foo
      @instance.attribute_2 = :foo
      @instance.attribute_2.should be == :foo
      @instance.attribute_3 = :foo
      @instance.attribute_3.should be == :foo
    end
  end
  describe "#attr_reader" do
    it "should define the getters returning default value" do
      @instance.attribute_4.should be_false
      @instance.attribute_5.should be_false
      @instance.attribute_6.should be_false
    end
  end
end
