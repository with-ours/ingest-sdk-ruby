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

      # @!attribute personalizations
      #   @deprecated
      #
      #   Deprecated legacy personalization assignments. Current API responses omit this
      #   field; use properties for accumulated personalization traits. Retained in the
      #   SDK for callers using older responses.
      #
      #   @return [Array<OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization>, nil]
      optional :personalizations,
               -> { OursprivacyIngest::Internal::Type::ArrayOf[OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization] }

      # @!method initialize(properties:, success:, personalizations: nil)
      #   Some parameter documentations has been truncated, see
      #   {OursprivacyIngest::Models::ExperimentPersonalizationResponse} for more details.
      #
      #   @param properties [Hash{Symbol=>String, Float, Boolean}] The visitor traits accumulated by your personalization property rules, keyed by
      #
      #   @param success [Boolean, OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success]
      #
      #   @param personalizations [Array<OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization>] Deprecated legacy personalization assignments. Current API responses omit this f

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

      class Personalization < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute assigned_at
        #
        #   @return [Float]
        required :assigned_at, Float

        # @!attribute experiment_id
        #
        #   @return [String]
        required :experiment_id, String

        # @!attribute variant_id
        #
        #   @return [String]
        required :variant_id, String

        # @!attribute experiment_key
        #
        #   @return [String, nil]
        optional :experiment_key, String, nil?: true

        # @!attribute experiment_name
        #
        #   @return [String, nil]
        optional :experiment_name, String, nil?: true

        # @!attribute variant_name
        #
        #   @return [String, nil]
        optional :variant_name, String, nil?: true

        # @!method initialize(assigned_at:, experiment_id:, variant_id:, experiment_key: nil, experiment_name: nil, variant_name: nil)
        #   @param assigned_at [Float]
        #   @param experiment_id [String]
        #   @param variant_id [String]
        #   @param experiment_key [String, nil]
        #   @param experiment_name [String, nil]
        #   @param variant_name [String, nil]
      end
    end
  end
end
