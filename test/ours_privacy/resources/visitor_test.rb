# frozen_string_literal: true

require_relative "../test_helper"

class OursPrivacy::Test::Resources::VisitorTest < OursPrivacy::Test::ResourceTest
  def test_upsert_required_params
    skip("Prism tests are disabled")

    response = @ours_privacy.visitor.upsert(token: "x", user_properties: {})

    assert_pattern do
      response => OursPrivacy::Models::VisitorUpsertResponse
    end

    assert_pattern do
      response => {
        success: OursPrivacy::Models::VisitorUpsertResponse::Success
      }
    end
  end
end
