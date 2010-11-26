class SessionTests < Application
  def index
    render
  end
  def add
    session[:test] = params[:id]
    redirect url(:controller => :session_tests, :action => :index)
  end
  def debug
    render
  end
end
