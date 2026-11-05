#!/usr/bin/env ruby
# frozen_string_literal: true

# Send one server-side event for a known visitor.
#
# Run from the repo root after `bundle install`:
#   OURS_PRIVACY_TOKEN=<source token> bundle exec ruby examples/track_event.rb
#
# Events go to production unless OURS_PRIVACY_BASE_URL overrides the host. The values below
# are samples. Don't put personal or health data or credentials in event properties.

require "securerandom"
require "oursprivacy_ingest"

token = ENV.fetch("OURS_PRIVACY_TOKEN", "")
abort("Missing OURS_PRIVACY_TOKEN: set it to your Source token.") if token.empty?

client = OursprivacyIngest::Client.new
response = client.track.event(
  token: token,
  event: "Example Signup", # must be an allowed event on your Source
  external_id: "example-user-123", # your own identifier for this visitor
  distinct_id: SecureRandom.uuid, # reuse this value if you resend, so the event deduplicates
  event_properties: {plan: "example-plan"}
)
puts("tracked: #{response.success}")
