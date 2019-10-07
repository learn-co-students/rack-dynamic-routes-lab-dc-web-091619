class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        #resp.write "Hello World"

        if req.path.match(/items/)

            param_item = req.path.split("/items/").last
            if @@items.find{|item| item.name == param_item}
                resp.write "#{@@items.find{|item| item.name == param_item}.price}"
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