# frozen_string_literal: true

# Standard libraries.
# rubocop:disable Lint/RedundantRequireStatement
require "English"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "openssl"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"
# rubocop:enable Lint/RedundantRequireStatement

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) &&
   caller.chain([$PROGRAM_NAME]).chain(ARGV).any?(/tapioca/) &&
   ARGV.none?(/dsl/)
  return
end

# Gems.
require "connection_pool"

# Package files.
require_relative "oursprivacy_ingest/version"
require_relative "oursprivacy_ingest/internal/util"
require_relative "oursprivacy_ingest/internal/type/converter"
require_relative "oursprivacy_ingest/internal/type/unknown"
require_relative "oursprivacy_ingest/internal/type/boolean"
require_relative "oursprivacy_ingest/internal/type/file_input"
require_relative "oursprivacy_ingest/internal/type/enum"
require_relative "oursprivacy_ingest/internal/type/union"
require_relative "oursprivacy_ingest/internal/type/array_of"
require_relative "oursprivacy_ingest/internal/type/hash_of"
require_relative "oursprivacy_ingest/internal/type/base_model"
require_relative "oursprivacy_ingest/internal/type/base_page"
require_relative "oursprivacy_ingest/internal/type/request_parameters"
require_relative "oursprivacy_ingest/internal"
require_relative "oursprivacy_ingest/request_options"
require_relative "oursprivacy_ingest/file_part"
require_relative "oursprivacy_ingest/errors"
require_relative "oursprivacy_ingest/internal/transport/base_client"
require_relative "oursprivacy_ingest/internal/transport/pooled_net_requester"
require_relative "oursprivacy_ingest/client"
require_relative "oursprivacy_ingest/models/track_event_params"
require_relative "oursprivacy_ingest/models/track_event_response"
require_relative "oursprivacy_ingest/models/visitor_upsert_params"
require_relative "oursprivacy_ingest/models/visitor_upsert_response"
require_relative "oursprivacy_ingest/models"
require_relative "oursprivacy_ingest/resources/track"
require_relative "oursprivacy_ingest/resources/visitor"
