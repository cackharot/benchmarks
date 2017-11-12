request = function()
    item = math.random(10000)
    wrk.method = "POST"
    wrk.headers["Content-Type"] = "application/vnd.api+json"
    wrk.body = '{"todo": {"description": "item '.. item ..'","complete": false}}'
    return wrk.format(nil, "/api/todos")
end
