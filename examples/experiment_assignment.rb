#!/usr/bin/env ruby
# frozen_string_literal: true

# Choose an experiment variant on the server, failing open: any assignment error serves the
# default experience, so an outage or timeout here can't break the page.
#
# Experiment calls take an experiment token (`exp_*`); they don't accept the Source token.
# Run from the repo root after `bundle install`:
#   OURS_PRIVACY_EXPERIMENT_TOKEN=exp_<token> bundle exec ruby examples/experiment_assignment.rb
#
# Calls go to production unless OURS_PRIVACY_BASE_URL overrides the host. The values below
# are samples.

require "oursprivacy_ingest"

def variant_for(client, token, visitor_id)
  assignment = client.experiments.assignment(
    "example_experiment",
    token: token,
    visitor_id: visitor_id,
    context: {url: "https://example.com/pricing"},
    # Don't let a slow call hold up the response you're serving.
    request_options: {timeout: 2.0, max_retries: 0}
  )
  (assignment.in_experiment && assignment.variant_name) || "default"
rescue StandardError => e
  warn("assignment unavailable, serving the default: #{e.message}")
  "default"
end

token = ENV.fetch("OURS_PRIVACY_EXPERIMENT_TOKEN", "")
abort("Missing OURS_PRIVACY_EXPERIMENT_TOKEN: set it to your exp_* experiment token.") if token.empty?

client = OursprivacyIngest::Client.new
puts("variant: #{variant_for(client, token, 'example-user-123')}")
