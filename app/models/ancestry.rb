class Ancestry
  ENDPOINTS = {
    production: 'https://familysearch.org/platform/tree/ancestry',
    beta: 'https://beta.familysearch.org/platform/tree/ancestry',
    sandbox: 'https://sandbox.familysearch.org/platform/tree/ancestry'
  }

  def initialize(token)
    @token = token
  end

  def fetch(person_id)
    params = { person: person_id, access_token: @token }
    response = Typhoeus.get(
      "#{ENDPOINTS[:sandbox]}?person=#{person_id}",
      headers: {
        'Accept' => 'application/x-fs-v1+json',
        'Authorization' => "Bearer #{@token}"
      }
    )
    byebug
  end
end