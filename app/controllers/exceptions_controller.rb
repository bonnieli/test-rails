class ExceptionsController < ActionController::Base
    before_action :status

    def show
        if @status == 404
            render json: { "error": "The route is not defined" }, status: @status
        else
            backtrace = @exception.backtrace.join("\n")
            render json: { "exception": @exception, "trace": backtrace, "status": @status }, status: @status
        end
    end

    protected

    #Info
    def status
        @exception  = request.env['action_dispatch.exception']
        @status     = ActionDispatch::ExceptionWrapper.new(request.env, @exception).status_code
        @response   = ActionDispatch::ExceptionWrapper.rescue_responses[@exception.class.name]
    end
end