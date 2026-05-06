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
      #   @return [Integer]
      required :failed, Integer

      # @!attribute results
      #
      #   @return [Array<OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1>]
      required :results,
               -> { OursprivacyIngest::Internal::Type::ArrayOf[union: OursprivacyIngest::Models::BatchCreateResponse::Result] }

      # @!attribute success
      #
      #   @return [Boolean]
      required :success, OursprivacyIngest::Internal::Type::Boolean

      # @!method initialize(accepted:, failed:, results:, success:)
      #   @param accepted [Integer]
      #   @param failed [Integer]
      #   @param results [Array<OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1>]
      #   @param success [Boolean]

      module Result
        extend OursprivacyIngest::Internal::Type::Union

        variant -> { OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0 }

        variant -> { OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1 }

        class UnionMember0 < OursprivacyIngest::Internal::Type::BaseModel
          # @!attribute index
          #
          #   @return [Integer]
          required :index, Integer

          # @!attribute success
          #
          #   @return [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success]
          required :success,
                   enum: -> { OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success }

          # @!method initialize(index:, success:)
          #   @param index [Integer]
          #   @param success [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0::Success]

          # @see OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0#success
          module Success
            extend OursprivacyIngest::Internal::Type::Enum

            TRUE = true

            # @!method self.values
            #   @return [Array<Boolean>]
          end
        end

        class UnionMember1 < OursprivacyIngest::Internal::Type::BaseModel
          # @!attribute code
          #
          #   @return [Symbol, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code]
          required :code, enum: -> { OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code }

          # @!attribute index
          #
          #   @return [Integer]
          required :index, Integer

          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!attribute success
          #
          #   @return [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success]
          required :success,
                   enum: -> { OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success }

          # @!method initialize(code:, index:, message:, success:)
          #   @param code [Symbol, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Code]
          #   @param index [Integer]
          #   @param message [String]
          #   @param success [Boolean, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1::Success]

          # @see OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1#code
          module Code
            extend OursprivacyIngest::Internal::Type::Enum

            INVALID_EVENT = :invalid_event
            QUEUE_FAILED = :queue_failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1#success
          module Success
            extend OursprivacyIngest::Internal::Type::Enum

            FALSE = false

            # @!method self.values
            #   @return [Array<Boolean>]
          end
        end

        # @!method self.variants
        #   @return [Array(OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember0, OursprivacyIngest::Models::BatchCreateResponse::Result::UnionMember1)]
      end
    end
  end
end
