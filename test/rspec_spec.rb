require File.dirname(__FILE__) + '/../lib/em-spec/rspec'

describe 'Rspec' do
  it 'should work as normal outside EM.describe' do
    1.should == 1
  end
end

describe EventMachine, "when testing with EM::SpecHelper" do
  include EM::SpecHelper

  it "should not require a call to done when #em is not used" do
    1.should == 1
  end

  it "should have timers" do
    em do
      start = Time.now

      EM.add_timer(0.5){
        (Time.now-start).should be_within(0.1).of(0.5)
        done
      }
    end
  end
end

describe EventMachine, "when testing with EM::Spec" do
  include EM::Spec

  it 'should work' do
    done
  end

  it 'should have timers' do
    start = Time.now

    EM.add_timer(0.5){
      (Time.now-start).should be_within(0.1).of(0.5)
      done
    }
  end

  it 'should have periodic timers' do
    num = 0
    start = Time.now

    timer = EM.add_periodic_timer(0.5){
      if (num += 1) == 2
        (Time.now-start).should be_within(0.1).of(1.0)
        EM.__send__ :cancel_timer, timer
        done
      end
    }
  end

  it 'should have deferrables' do
    defr = EM::DefaultDeferrable.new
    defr.timeout(1)
    defr.errback{
      done
    }
  end

end

describe "Rspec", "when running an example group after another group that uses EMSpec " do
  it "should work normally" do
    :does_not_hang.should_not be_false
  end
end
