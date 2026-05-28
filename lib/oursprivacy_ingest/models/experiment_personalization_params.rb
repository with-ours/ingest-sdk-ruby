# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Experiments#personalization
    class ExperimentPersonalizationParams < OursprivacyIngest::Internal::Type::BaseModel
      extend OursprivacyIngest::Internal::Type::RequestParameters::Converter
      include OursprivacyIngest::Internal::Type::RequestParameters

      # @!attribute token
      #   The experiment token (`exp_*`).
      #
      #   @return [String]
      required :token, String

      # @!attribute visitor_id
      #
      #   @return [String]
      required :visitor_id, String

      # @!method initialize(token:, visitor_id:, request_options: {})
      #   @param token [String] The experiment token (`exp_*`).
      #
      #   @param visitor_id [String]
      #
      #   @param request_options [OursprivacyIngest::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
