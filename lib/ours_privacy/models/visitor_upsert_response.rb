# frozen_string_literal: true

module OursPrivacy
  module Models
    # @see OursPrivacy::Resources::Visitor#upsert
    class VisitorUpsertResponse < OursPrivacy::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, OursPrivacy::Models::VisitorUpsertResponse::Success]
      required :success, enum: -> { OursPrivacy::Models::VisitorUpsertResponse::Success }

      # @!method initialize(success:)
      #   @param success [Boolean, OursPrivacy::Models::VisitorUpsertResponse::Success]

      # @see OursPrivacy::Models::VisitorUpsertResponse#success
      module Success
        extend OursPrivacy::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
