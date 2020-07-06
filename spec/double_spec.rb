require "spec_helper"

RSpec.describe "Doubles" do
  # Instead of using instances in these tests,
  # replace each of these with a 'leaf' test double
  it "leaf returns expected color" do

    def method_under_test(leaf)
      if leaf.color
        "green"
      end
    end
    leaf = double("Successfully responds", color: "green")

    expect(leaf.color).to eq("green")

    expect(leaf).to_not be_instance_of(Leaf)
  end

  it "leaf's branch returns expected length" do

    def method_under_test(leaf)
      if leaf.branch.length
        "4 feet"
      end
    end
    leaf = double("Successfully responds", branch: double("is length 4", length: "4 feet"))

    expect(leaf.branch.length).to eq("4 feet")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
  end

  it "leaf's branch's tree returns expected bark" do

    def method_under_test(leaf)
      if leaf.branch.tree.bark
        "thick and brown"
      end
    end

    leaf = double("Successfully responds", branch: double("Successfully responds", tree: double("Successfully responds", bark: "thick and brown")))

    expect(leaf.branch.tree.bark).to eq("thick and brown")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
    expect(leaf.branch.tree).to_not be_instance_of(Tree)
  end
end
