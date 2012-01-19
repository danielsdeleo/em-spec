require File.dirname(__FILE__) + '/../lib/em-spec/rspec'

describe EventMachine, "when running failing examples" do
  include EM::Spec

  it "should not bubble failures beyond rspec" do
    EM.add_timer(0.1) do
      :should_not_bubble.should == :failures
      done
    end
  end

  it "should not block on failure" do
     1.should == 2
  end
end
