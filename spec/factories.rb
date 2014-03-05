FactoryGirl.define do
  factory :requests do
    rid SecureRandom.uuid[0, 8]
    request_data '{"headers":{"User-Agent":"ReHTTP/v1.0"},"data":{}}'
    response_data '{"headers":{"server":"GitHub.com","date":"Sun, 02 Mar 2014 05:30:12 GMT","content-type":"application/json; charset=utf-8","connection":"close","status":"401 Unauthorized","x-ratelimit-limit":"60","x-ratelimit-remaining":"44","x-ratelimit-reset":"1393741019","x-github-media-type":"github.beta","x-content-type-options":"nosniff","content-length":"90","access-control-allow-credentials":"true","access-control-expose-headers":"ETag, Link, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval","access-control-allow-origin":"*","x-github-request-id":"7CB9A272:3E9B:23E437A:5312C1E3"},"body":"{\"message\":\"Requires authentication\",\"documentation_url\":\"http://developer.github.com/v3\"}","status":401}'
    request_type 'GET'
    url 'https://api.github.com/user'
  end
end
