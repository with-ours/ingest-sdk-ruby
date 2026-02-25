# frozen_string_literal: true

require_relative "../test_helper"

class OursprivacyIngest::Test::Resources::VisitorTest < OursprivacyIngest::Test::ResourceTest
  def test_upsert_required_params
    skip("Mock server tests are disabled")

    response = @ours_privacy.visitor.upsert(token: "x", user_properties: {})

    assert_pattern do
      response => OursprivacyIngest::Models::VisitorUpsertResponse
    end

    assert_pattern do
      response => {
        success: OursprivacyIngest::Models::VisitorUpsertResponse::Success
      }
    end
  end
end
