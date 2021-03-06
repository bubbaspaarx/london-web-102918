require "pry"

class App
  def self.homepage
    "WELCOME HOME My name is Dan"
  end

  def call(environment_hash)
    req = Rack::Request.new(environment_hash)
    resp = Rack::Response.new

    if req.path == "/"
      resp.write(App.homepage)
      resp.status = 200
    elsif req.path == "/cats"
      resp.write("<h1>MEOW</h1>")
      resp.status = 200
    else
      resp.write("THIS IS BAD... 404")
      resp.status = 404
    end

    resp.finish # implicit return of the status code, header, and body
  end
end
