class BanHammer
  def initialize(app)
    @app = app
  end
  
  def call(env)
    #if BannedIP.find_by_ip(env["REMOTE_ADDR"])
    if BannedIp.connection.execute("SELECT ip FROM bannedips" +" WHERE ip = %s" % env["REMOTE_ADDR"].to_s)
      file = "\#{RAILS_ROOT}/public/banned.html"
      [403, {"Content-Type" => "text/html" }, [File.read(file)]]
    else
      @status, @headers, @response = @app.call(env)
      [@status, @headers, self]
    end
  end
  
  def each(&block)
    @response.each(&block)
  end
end