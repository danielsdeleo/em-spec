require 'eventmachine'
require File.dirname(__FILE__) + '/../ext/fiber18'

module EventMachine
  module SpecHelper

    def em(&block)
      EM.run do
        EM.next_tick do
          em_spec_exception = nil

          @_em_spec_fiber = Fiber.new do
            begin
              block.call
            rescue Exception => em_spec_exception
              done
            end

            Fiber.yield
          end

          @_em_spec_fiber.resume

          raise em_spec_exception if em_spec_exception
        end
      end
    end

    def done
      EM.schedule {
        finish_em_spec_fiber
      }
    end

    private

    def finish_em_spec_fiber
      EM.stop_event_loop if EM.reactor_running?
      @_em_spec_fiber.transfer if @_em_spec_fiber.alive?
    end

  end

  module Spec

    include SpecHelper

    def instance_eval(&block)
      em do
        super(&block)
      end
    end
  end
end
