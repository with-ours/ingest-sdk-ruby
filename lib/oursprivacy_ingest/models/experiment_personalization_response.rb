# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Experiments#personalization
    class ExperimentPersonalizationResponse < OursprivacyIngest::Internal::Type::BaseModel
      # @!attribute properties
      #   The visitor traits accumulated by your personalization property rules, keyed by
      #   property key. Values are always scalars — a string, number, or boolean, or null
      #   when the captured field was itself empty. Empty for a visitor who has not
      #   matched any rule yet. These same values are delivered to the visitor's browser
      #   and are readable by anyone who knows the visitor_id, so never accumulate
      #   secrets, credentials, PHI, or confidential data into a property.
      #
      #   @return [Hash{Symbol=>String, Float, Boolean}]
      required :properties,
               -> { OursprivacyIngest::Internal::Type::HashOf[union: OursprivacyIngest::Models::ExperimentPersonalizationResponse::Property] }

      # @!attribute success
      #
      #   @return [Boolean, OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success]
      required :success, enum: -> { OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success }

      # @!method initialize(properties:, success:)
      #   Some parameter documentations has been truncated, see
      #   {OursprivacyIngest::Models::ExperimentPersonalizationResponse} for more details.
      #
      #   @param properties [Hash{Symbol=>String, Float, Boolean}] The visitor traits accumulated by your personalization property rules, keyed by
      #
      #   @param success [Boolean, OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success]

      module Property
        extend OursprivacyIngest::Internal::Type::Union

        variant String

        variant Float

        variant OursprivacyIngest::Internal::Type::Boolean

        # @!method self.variants
        #   @return [Array(String, Float, Boolean)]
      end

      # @see OursprivacyIngest::Models::ExperimentPersonalizationResponse#success
      module Success
        extend OursprivacyIngest::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
