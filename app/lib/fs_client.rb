class FsClient
  attr_accessor :client
  
  def initialize(access_token)
    @client = FamilySearch::Client.new :environment => Rails.env.development? ? :sandbox : :production,
                                       :key => Rails.application.secrets.family_search_app_key,
                                       :access_token => access_token
  end

  def current_person
    res = client.get "#{client.base_url}/platform/users/current"
    res.body.users[0]
  end

  def ancestry(person_id)
    res = client.get "#{client.base_url}/platform/tree/ancestry?person=#{person_id}"
    res.body
  end

end