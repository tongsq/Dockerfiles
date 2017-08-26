ngx.say('hello world!')
ngx.say(type(ngx.var))
ngx.say(ngx.var.uri)
ngx.say(ngx.var.request_uri)
local vars = ngx.var
for v in pairs(vars) 
do
    if type(v) ~= "table" then	
        ngx.say(table.concat(v,','))
    else
	ngx.say(1)
    end
end
local arr = {a='abc','eft'}
arr[2] = 123
for i,v in pairs(arr)
do 
    ngx.say("i:" .. i .. "v:" .. v)
end
--vars[1] = 123
table.sort(vars)
table.remove(vars, 1)
table.insert(vars, 123)
ngx.say(table.concat(vars,','))
ngx.say(#vars,vars.remote_addr)
ngx.say(ngx.today())
