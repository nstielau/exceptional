module Exceptional
  class Catcher
    class << self
      def handle(exception, controller=nil, request=nil)
        if Config.should_send_to_api?
          data = ControllerExceptionData.new(exception, controller, request)
          Remote.error(data)
        end
      end

      def handle_without_controller(exception, name=nil)
        if Config.should_send_to_api?
          data = ExceptionData.new(exception, name)
          Remote.error(data)
        end
      end
    end
  end
end