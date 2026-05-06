# frozen_string_literal: true

require_relative "../test_helper"

class OursprivacyIngest::Test::Resources::BatchTest < OursprivacyIngest::Test::ResourceTest
  def test_create_required_params
    skip("Mock server tests are disabled")

    response = @ours_privacy.batch.create(token: "x", events: [{event: "x"}])

    assert_pattern do
      response => OursprivacyIngest::Models::BatchCreateResponse
    end

    assert_pattern do
      response => {
        accepted: Integer,
        failed: OursprivacyIngest::Models::BatchCreateResponse::Failed,
        results: ^(OursprivacyIngest::Internal::Type::ArrayOf[OursprivacyIngest::Models::BatchCreateResponse::Result]),
        success: OursprivacyIngest::Models::BatchCreateResponse::Success
      }
    end
  end
end
