# frozen_string_literal: true

module OursprivacyIngest
  module Models
    # @see OursprivacyIngest::Resources::Track#event
    class TrackEventResponse < OursprivacyIngest::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, OursprivacyIngest::Models::TrackEventResponse::Success]
      required :success, enum: -> { OursprivacyIngest::Models::TrackEventResponse::Success }

      # @!method initialize(success:)
      #   @param success [Boolean, OursprivacyIngest::Models::TrackEventResponse::Success]

      # @see OursprivacyIngest::Models::TrackEventResponse#success
      module Success
        extend OursprivacyIngest::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
