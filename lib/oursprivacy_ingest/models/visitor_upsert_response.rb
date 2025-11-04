# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Visitor#upsert
    class VisitorUpsertResponse < OursprivacyIngest::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, OursprivacyIngest::Models::VisitorUpsertResponse::Success]
      required :success, enum: -> { OursprivacyIngest::Models::VisitorUpsertResponse::Success }

      # @!method initialize(success:)
      #   @param success [Boolean, OursprivacyIngest::Models::VisitorUpsertResponse::Success]

      # @see OursprivacyIngest::Models::VisitorUpsertResponse#success
      module Success
        extend OursprivacyIngest::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
