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
require_relative "ours_privacy/version"
require_relative "ours_privacy/internal/util"
require_relative "ours_privacy/internal/type/converter"
require_relative "ours_privacy/internal/type/unknown"
require_relative "ours_privacy/internal/type/boolean"
require_relative "ours_privacy/internal/type/file_input"
require_relative "ours_privacy/internal/type/enum"
require_relative "ours_privacy/internal/type/union"
require_relative "ours_privacy/internal/type/array_of"
require_relative "ours_privacy/internal/type/hash_of"
require_relative "ours_privacy/internal/type/base_model"
require_relative "ours_privacy/internal/type/base_page"
require_relative "ours_privacy/internal/type/request_parameters"
require_relative "ours_privacy/internal"
require_relative "ours_privacy/request_options"
require_relative "ours_privacy/file_part"
require_relative "ours_privacy/errors"
require_relative "ours_privacy/internal/transport/base_client"
require_relative "ours_privacy/internal/transport/pooled_net_requester"
require_relative "ours_privacy/client"
require_relative "ours_privacy/models/track_event_params"
require_relative "ours_privacy/models/track_event_response"
require_relative "ours_privacy/models/visitor_upsert_params"
require_relative "ours_privacy/models/visitor_upsert_response"
require_relative "ours_privacy/models"
require_relative "ours_privacy/resources/track"
require_relative "ours_privacy/resources/visitor"
