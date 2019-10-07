require "pry"

class Application

  def call(env)

    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
      req_item = req.path.split("/items/").last

      if @@items.find {|i| i.name == req_item}
        req_item_price = @@items.find{|i| i.name == req_item}.price

        resp.write req_item_price
        resp.status = 200

      else
        resp.write "Item not found"
        resp.status = 400
      end
      
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
  
end