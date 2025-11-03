# frozen_string_literal: true

module OursPrivacy
  module Models
    # @see OursPrivacy::Resources::Track#event
    class TrackEventResponse < OursPrivacy::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, OursPrivacy::Models::TrackEventResponse::Success]
      required :success, enum: -> { OursPrivacy::Models::TrackEventResponse::Success }

      # @!method initialize(success:)
      #   @param success [Boolean, OursPrivacy::Models::TrackEventResponse::Success]

      # @see OursPrivacy::Models::TrackEventResponse#success
      module Success
        extend OursPrivacy::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
