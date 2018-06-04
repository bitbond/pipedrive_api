require "spec_helper"

describe PipedriveAPI::Person do
  before do
    PipedriveAPI::Base.auth(api_token: 'atoken', account_name: 'company')

    @all_response = JSON.parse(File.read(File.join(File.dirname(__FILE__), "fixtures/person", "all_response.json"))).to_json
    @find_response = JSON.parse(File.read(File.join(File.dirname(__FILE__), "fixtures/person", "find_response.json"))).to_json
    @create_response = JSON.parse(File.read(File.join(File.dirname(__FILE__), "fixtures/person", "create_response.json"))).to_json
    @update_response = JSON.parse(File.read(File.join(File.dirname(__FILE__), "fixtures/person", "update_response.json"))).to_json
  end

  context "when Pipedrive provides response" do

    before do
      @params = { name: "Joe Bloggs", email: "joe@example.com" }
      @update_params = { name: "Joe" }

      stub_request(:get, "https://company.pipedrive.com/v1/persons?api_token=atoken").
        with(headers: { 'Content-Type' => 'application/json' }).
        to_return(body: @all_response)

      stub_request(:get, "https://company.pipedrive.com/v1/persons/5?api_token=atoken").
        with(headers: { 'Content-Type' => 'application/json' }).
        to_return(body: @find_response)

      stub_request(:post, "https://company.pipedrive.com/v1/persons?api_token=atoken").
        with(body: @params, headers: { 'Content-Type' => 'application/json' }).
        to_return(body: @create_response)

      stub_request(:put, "https://company.pipedrive.com/v1/persons/5?api_token=atoken").
        with(body: @update_params, headers: { 'Content-Type' => 'application/json' }).
        to_return(body: @update_response)
    end

    it "finds all persons" do
      expect(PipedriveAPI::Person.all.to_json).to eq(JSON.parse(@all_response)["data"].to_json)
    end

    it "finds a person" do
      expect(PipedriveAPI::Person.find(5).to_json).to eq(JSON.parse(@find_response)["data"].to_json)
    end

    it "creates a person" do
      expect(PipedriveAPI::Person.create(@params).to_json).to eq(JSON.parse(@create_response)["data"].to_json)
    end

    it "updates a person" do
      expect(PipedriveAPI::Person.update(5, @update_params).to_json).to eq(JSON.parse(@update_response)["data"].to_json)
    end

  end


end
