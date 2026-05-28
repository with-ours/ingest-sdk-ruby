# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Experiments#assignment
    module ExperimentAssignmentResponse
      extend OursprivacyIngest::Internal::Type::Union

      variant -> { OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0 }

      variant -> { OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1 }

      class UnionMember0 < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute experiment_id
        #
        #   @return [String]
        required :experiment_id, String

        # @!attribute in_experiment
        #
        #   @return [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment]
        required :in_experiment,
                 enum: -> { OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment }

        # @!attribute success
        #
        #   @return [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success]
        required :success,
                 enum: -> { OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success }

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

        # @!attribute is_control
        #
        #   @return [Boolean, nil]
        optional :is_control, OursprivacyIngest::Internal::Type::Boolean, nil?: true

        # @!attribute type
        #
        #   @return [String, nil]
        optional :type, String, nil?: true

        # @!attribute variant_name
        #
        #   @return [String, nil]
        optional :variant_name, String, nil?: true

        # @!method initialize(experiment_id:, in_experiment:, success:, variant_id:, experiment_key: nil, experiment_name: nil, is_control: nil, type: nil, variant_name: nil)
        #   @param experiment_id [String]
        #   @param in_experiment [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::InExperiment]
        #   @param success [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0::Success]
        #   @param variant_id [String]
        #   @param experiment_key [String, nil]
        #   @param experiment_name [String, nil]
        #   @param is_control [Boolean, nil]
        #   @param type [String, nil]
        #   @param variant_name [String, nil]

        # @see OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0#in_experiment
        module InExperiment
          extend OursprivacyIngest::Internal::Type::Enum

          TRUE = true

          # @!method self.values
          #   @return [Array<Boolean>]
        end

        # @see OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0#success
        module Success
          extend OursprivacyIngest::Internal::Type::Enum

          TRUE = true

          # @!method self.values
          #   @return [Array<Boolean>]
        end
      end

      class UnionMember1 < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute in_experiment
        #
        #   @return [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment]
        required :in_experiment,
                 enum: -> { OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment }

        # @!attribute success
        #
        #   @return [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success]
        required :success,
                 enum: -> { OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success }

        # @!method initialize(in_experiment:, success:)
        #   @param in_experiment [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::InExperiment]
        #   @param success [Boolean, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1::Success]

        # @see OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1#in_experiment
        module InExperiment
          extend OursprivacyIngest::Internal::Type::Enum

          FALSE = false

          # @!method self.values
          #   @return [Array<Boolean>]
        end

        # @see OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1#success
        module Success
          extend OursprivacyIngest::Internal::Type::Enum

          TRUE = true

          # @!method self.values
          #   @return [Array<Boolean>]
        end
      end

      # @!method self.variants
      #   @return [Array(OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember0, OursprivacyIngest::Models::ExperimentAssignmentResponse::UnionMember1)]
    end
  end
end
