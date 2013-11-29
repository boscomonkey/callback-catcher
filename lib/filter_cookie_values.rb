# Filter
# "_callback-catcher_session=BAh7CEkiD3;first=george;last=washington"
# as
# "_callback-catcher_session=[FILTERED];first=[FILTERED];last=[FILTERED]"
def filter_cookie_values(headers, key, replacement:'[FILTERED]', separator:';')
  cookies = headers[key]
  lines = cookies.split(separator)
  filtered = lines.map {|line| line.sub /\=.*/, "=#{replacement}" }
  headers[key] = filtered.join(separator)
end
