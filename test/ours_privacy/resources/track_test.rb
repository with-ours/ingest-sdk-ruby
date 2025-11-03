# frozen_string_literal: true

require_relative "../test_helper"

class OursPrivacy::Test::Resources::TrackTest < OursPrivacy::Test::ResourceTest
  def test_event_required_params
    skip("Prism tests are disabled")

    response = @ours_privacy.track.event(token: "x", event: "x")

    assert_pattern do
      response => OursPrivacy::Models::TrackEventResponse
    end

    assert_pattern do
      response => {
        success: OursPrivacy::Models::TrackEventResponse::Success
      }
    end
  end
end
