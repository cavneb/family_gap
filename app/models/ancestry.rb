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
    response = Typhoeus.post(ENDPOINTS[:sandbox], body: params)
    byebug
  end
end