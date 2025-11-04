# frozen_string_literal: true

module OursprivacyIngest
  class Client < OursprivacyIngest::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [OursprivacyIngest::Resources::Track]
    attr_reader :track

    # @return [OursprivacyIngest::Resources::Visitor]
    attr_reader :visitor

    # @api private
    #
    # @return [Boolean]
    def base_url_overridden? = @base_url_overridden

    # Creates and returns a new client for interacting with the API.
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["OURS_PRIVACY_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      base_url: ENV["OURS_PRIVACY_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      @base_url_overridden = !base_url.nil?

      base_url ||= "https://api.oursprivacy.com/api/v1"

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @track = OursprivacyIngest::Resources::Track.new(client: self)
      @visitor = OursprivacyIngest::Resources::Visitor.new(client: self)
    end
  end
end
