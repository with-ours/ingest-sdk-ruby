# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Experiments#personalization
    class ExperimentPersonalizationResponse < OursprivacyIngest::Internal::Type::BaseModel
      # @!attribute personalizations
      #
      #   @return [Array<OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization>]
      required :personalizations,
               -> { OursprivacyIngest::Internal::Type::ArrayOf[OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization] }

      # @!attribute success
      #
      #   @return [Boolean, OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success]
      required :success, enum: -> { OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success }

      # @!method initialize(personalizations:, success:)
      #   @param personalizations [Array<OursprivacyIngest::Models::ExperimentPersonalizationResponse::Personalization>]
      #   @param success [Boolean, OursprivacyIngest::Models::ExperimentPersonalizationResponse::Success]

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
