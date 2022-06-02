class ExceptionsController < ActionController::Base
    before_action :status

    def show
        backtrace = @exception.backtrace.join("\n")
        render json: { "exception": @exception, "trace": backtrace, "status": @status }
    end

    protected

    #Info
    def status
        @exception  = request.env['action_dispatch.exception']
        @status     = ActionDispatch::ExceptionWrapper.new(request.env, @exception).status_code
        @response   = ActionDispatch::ExceptionWrapper.rescue_responses[@exception.class.name]
    end
end