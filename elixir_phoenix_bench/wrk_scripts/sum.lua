request = function()
    a = math.random(100)
    b = math.random(100)
    wrk.method = "POST"
    wrk.headers["Content-Type"] = "application/vnd.api+json"
    wrk.body = '{"a":' .. a .. ',"b":' .. b .. '}'
    return wrk.format(nil, "/api/sum")
end
