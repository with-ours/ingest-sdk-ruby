# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Batch#create
    class BatchCreateResponse < OursprivacyIngest::Internal::Type::BaseModel
      # @!attribute accepted
      #
      #   @return [Integer]
      required :accepted, Integer

      # @!attribute failed
      #
      #   @return [Float, OursprivacyIngest::Models::BatchCreateResponse::Failed]
      required :failed, enum: -> { OursprivacyIngest::Models::BatchCreateResponse::Failed }

      # @!attribute results
      #
      #   @return [Array<OursprivacyIngest::Models::BatchCreateResponse::Result>]
      required :results,
               -> { OursprivacyIngest::Internal::Type::ArrayOf[OursprivacyIngest::Models::BatchCreateResponse::Result] }

      # @!attribute success
      #
      #   @return [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Success]
      required :success, enum: -> { OursprivacyIngest::Models::BatchCreateResponse::Success }

      # @!method initialize(accepted:, failed:, results:, success:)
      #   @param accepted [Integer]
      #   @param failed [Float, OursprivacyIngest::Models::BatchCreateResponse::Failed]
      #   @param results [Array<OursprivacyIngest::Models::BatchCreateResponse::Result>]
      #   @param success [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Success]

      # @see OursprivacyIngest::Models::BatchCreateResponse#failed
      module Failed
        extend OursprivacyIngest::Internal::Type::Enum

        FAILED_0 = 0

        # @!method self.values
        #   @return [Array<Float>]
      end

      class Result < OursprivacyIngest::Internal::Type::BaseModel
        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute success
        #
        #   @return [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Result::Success]
        required :success, enum: -> { OursprivacyIngest::Models::BatchCreateResponse::Result::Success }

        # @!method initialize(index:, success:)
        #   @param index [Integer]
        #   @param success [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Result::Success]

        # @see OursprivacyIngest::Models::BatchCreateResponse::Result#success
        module Success
          extend OursprivacyIngest::Internal::Type::Enum

          TRUE = true

          # @!method self.values
          #   @return [Array<Boolean>]
        end
      end

      # @see OursprivacyIngest::Models::BatchCreateResponse#success
      module Success
        extend OursprivacyIngest::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
