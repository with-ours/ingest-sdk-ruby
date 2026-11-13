# Ours Privacy Ruby API library

The Ours Privacy Ruby library provides convenient access to the Ours Privacy REST API from any Ruby 3.3.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/with-ours/ingest-sdk-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

`token` is the Source token from your Ours Privacy dashboard. Events must be allow-listed: an event that isn't on your [Event Allowlist](https://docs.oursprivacy.com/docs/allow-listing-events) isn't forwarded to your destinations.

See the [SDK guide](https://docs.oursprivacy.com/docs/ruby) and the runnable code in [`examples`](examples).

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/oursprivacy-ingest).

The REST API documentation can be found on [docs.oursprivacy.com](https://docs.oursprivacy.com).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "oursprivacy-ingest", "~> 2.3.0"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "oursprivacy_ingest"

ours_privacy = OursprivacyIngest::Client.new

response = ours_privacy.track.event(
  token: "YOUR_SOURCE_TOKEN",
  event: "signup_completed",
  distinct_id: "evt_01J9ZK3Q7X",
  event_properties: {plan: "pro", value: 49, currency: "USD"},
  external_id: "crm_contact_1042",
  identity_context: {ip: "203.0.113.10", userAgent: "Mozilla/5.0"}
)

puts(response.success)
```

### Identify a visitor

Set properties on a visitor, creating the visitor if there's no match.

```ruby
require "bundler/setup"
require "oursprivacy_ingest"

ours_privacy = OursprivacyIngest::Client.new

response = ours_privacy.visitor.upsert(
  token: "YOUR_SOURCE_TOKEN",
  user_properties: {first_name: "Sample", last_name: "User"},
  email: "user@example.com"
)

puts(response.success)
```

### Send a batch of events

Send many events in one request, each with its own required `distinctId`.

```ruby
require "bundler/setup"
require "oursprivacy_ingest"

ours_privacy = OursprivacyIngest::Client.new

batch = ours_privacy.batch.create(
  token: "YOUR_SOURCE_TOKEN",
  events: [
    {event: "signup_completed", distinctId: "evt_01J9ZK3Q7X", externalId: "crm_contact_1042"},
    {event: "plan_upgraded", distinctId: "evt_01J9ZK3Q8Y", externalId: "crm_contact_1042"}
  ]
)

puts(batch.accepted)
```

A partial success returns HTTP 207 with a result for each row. Retry only the rows whose `code` is `queue_failed`, with the same `distinctId`. You can backfill events up to one year old; older `time` values are clamped.

### Get an experiment assignment

Look up a visitor's variant, using the experiment's `exp_*` token rather than the Source token.

```ruby
require "bundler/setup"
require "oursprivacy_ingest"

ours_privacy = OursprivacyIngest::Client.new

response = ours_privacy.experiments.assignment(
  "checkout_redesign",
  token: "exp_YOUR_EXPERIMENT_TOKEN",
  visitor_id: "visitor_1042"
)

puts(response)
```

### Further reading

The docs cover each endpoint in full.

- [Track](https://docs.oursprivacy.com/docs/reference/track)
- [Identify](https://docs.oursprivacy.com/docs/reference/identify)
- [Batch](https://docs.oursprivacy.com/docs/reference/batch)
- [Rate limits](https://docs.oursprivacy.com/docs/reference/rate-limits)
- [Server-side experimentation](https://docs.oursprivacy.com/docs/experimentation/server-side)

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `OursprivacyIngest::Errors::APIError` will be thrown:

```ruby
begin
  track = ours_privacy.track.event(token: "REPLACE_ME", event: "REPLACE_ME")
rescue OursprivacyIngest::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue OursprivacyIngest::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue OursprivacyIngest::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
ours_privacy = OursprivacyIngest::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
ours_privacy.track.event(token: "REPLACE_ME", event: "REPLACE_ME", request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
ours_privacy = OursprivacyIngest::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
ours_privacy.track.event(token: "REPLACE_ME", event: "REPLACE_ME", request_options: {timeout: 5})
```

On timeout, `OursprivacyIngest::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `OursprivacyIngest::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
response =
  ours_privacy.track.event(
    token: "REPLACE_ME",
    event: "REPLACE_ME",
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(response[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `OursprivacyIngest::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `OursprivacyIngest::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
ours_privacy.track.event(
  token: "YOUR_SOURCE_TOKEN",
  event: "signup_completed",
  distinct_id: "evt_01J9ZK3Q7X",
  event_properties: {plan: "pro", value: 49, currency: "USD"},
  external_id: "crm_contact_1042",
  identity_context: OursprivacyIngest::TrackEventParams::IdentityContext.new(ip: "203.0.113.10", user_agent: "Mozilla/5.0")
)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
ours_privacy.track.event(
  token: "YOUR_SOURCE_TOKEN",
  event: "signup_completed",
  distinct_id: "evt_01J9ZK3Q7X",
  event_properties: {plan: "pro", value: 49, currency: "USD"},
  external_id: "crm_contact_1042",
  identity_context: {ip: "203.0.113.10", userAgent: "Mozilla/5.0"}
)

# You can also splat a full Params class:
params = OursprivacyIngest::TrackEventParams.new(
  token: "YOUR_SOURCE_TOKEN",
  event: "signup_completed",
  distinct_id: "evt_01J9ZK3Q7X",
  event_properties: {plan: "pro", value: 49, currency: "USD"},
  external_id: "crm_contact_1042",
  identity_context: OursprivacyIngest::TrackEventParams::IdentityContext.new(ip: "203.0.113.10", user_agent: "Mozilla/5.0")
)
ours_privacy.track.event(**params)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.3.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/with-ours/ingest-sdk-ruby/tree/main/CONTRIBUTING.md).
