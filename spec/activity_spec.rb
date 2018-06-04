require 'spec_helper'

describe PipedriveAPI::Activity do
  before(:each) do
    PipedriveAPI::Base.auth(api_token: 'atoken', account_name: 'company')

    @create_response = JSON.parse(File.read(File.join(File.dirname(__FILE__), "fixtures/activity", "create_response.json"))).to_json
  end

  context "when Pipedrive provides response" do
    before(:each) do
      @params = { subject: "Call", type: "call" }

      stub_request(:post, "https://company.pipedrive.com/v1/activities?api_token=atoken").
        with(body: @params, headers: { 'Content-Type' => 'application/json' }).
        to_return(body: @create_response)
    end

    it "creates a activity" do
      expect(PipedriveAPI::Activity.create(@params).to_json).to eq(JSON.parse(@create_response)["data"].to_json)
    end

  end
end
