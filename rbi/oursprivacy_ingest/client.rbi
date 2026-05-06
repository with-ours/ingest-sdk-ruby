# typed: strong

module OursprivacyIngest
  class Client < OursprivacyIngest::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(OursprivacyIngest::Resources::Batch) }
    attr_reader :batch

    sig { returns(OursprivacyIngest::Resources::Track) }
    attr_reader :track

    sig { returns(OursprivacyIngest::Resources::Visitor) }
    attr_reader :visitor

    # @api private
    sig { returns(T::Boolean) }
    def base_url_overridden?
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["OURS_PRIVACY_BASE_URL"]`
      base_url: ENV["OURS_PRIVACY_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: OursprivacyIngest::Client::DEFAULT_MAX_RETRIES,
      timeout: OursprivacyIngest::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: OursprivacyIngest::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: OursprivacyIngest::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
