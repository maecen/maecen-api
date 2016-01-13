def json_route_to(path,params={})
  route_to(path, {format:'json'}.merge(params))
end
