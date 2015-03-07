require 'typhoeus'

class HomeController < ApplicationController

  def index
    if current_user && current_user.access_token
      base_url = "https://sandbox.familysearch.org"

      hydra = Typhoeus::Hydra.hydra
      person_request = typhoeus_request("#{base_url}/platform/tree/persons/#{current_user.person_id}")
      requests = {}
      person_request.on_complete do |response|
        person = JSON.parse(response.body)['persons'][0]

        requests[:ancestry] = typhoeus_request(person['links']['ancestry']['href'])
        hydra.queue requests[:ancestry]

        requests[:parents] = typhoeus_request(person['links']['parents']['href'])
        hydra.queue requests[:parents]

        requests[:spouses] = typhoeus_request(person['links']['spouses']['href'])
        hydra.queue requests[:spouses]
      end
      hydra.queue person_request
      hydra.run

      @person = JSON.parse(person_request.response.body)
      @ancestry = JSON.parse(requests[:ancestry].response.body) rescue nil
      @parents = JSON.parse(requests[:parents].response.body) rescue nil
      @spouses = JSON.parse(requests[:spouses].response.body) rescue nil

      @data = {
        person: @person,
        ancestry: @ancestry,
        parents: @parents,
        spouses: @spouses
      }

      render json: @data


      # request = Typhoeus::Request.new(
      #   "www.example.com",
      #   method: :post,
      #   body: "this is a request body",
      #   params: { field1: "a field" },
      #   headers: { Accept: "text/html" }
      # )

      # hydra.queue(Typhoeus::Request.new("www.example.com", followlocation: true))


      # @client = FamilySearch::Client.new :environment => Rails.env.development? ? :sandbox : :production,
      #                                    :key => Rails.application.secrets.family_search_app_key,
      #                                    :access_token => current_user.access_token
      #
      # @person = @client.

      # @client = FsClient.new(current_user.access_token)
      # @person = @client.person(current_user.person_id).persons[0]
      # @spouses = @client.spouses(current_user.person_id)
      # @parents = @client.parents(current_user.person_id)
      # @ancestry = @client.ancestry(current_user.lin)
    end
  end

  def typhoeus_request(url)
    Typhoeus::Request.new(url, method: :get, headers: { 'Authorization' => "Bearer #{current_user.access_token}", 'Accept' => 'application/x-gedcomx-v1+json' })
  end

end
