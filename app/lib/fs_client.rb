class FsClient
  attr_accessor :client
  
  def initialize(access_token)
    @client = FamilySearch::Client.new :environment => Rails.env.development? ? :sandbox : :production,
                                       :key => Rails.application.secrets.family_search_app_key,
                                       :access_token => access_token
  end

  def fetch_url(url)
    res = client.get url
    res.body
  end

  def current_person
    res = client.get "#{client.base_url}/platform/users/current"
    res.body.users[0]
  end

  def person(person_id)
    res = client.get "#{client.base_url}/platform/tree/persons/#{person_id}"
    res.body
  end

  def parents(person_id)
    res = client.get "#{client.base_url}/platform/tree/persons/#{person_id}/parents"
    res.body
  end

  def spouses(person_id)
    res = client.get "#{client.base_url}/platform/tree/persons/#{person_id}/spouses"
    res.body
  end

  def ancestry(person)
    byebug
    res = client.get "#{client.base_url}/platform/tree/ancestry?person=#{person.to_s}"
    res.body
  end

end