Rails.application.config.middleware.use OmniAuth::Builder do
  provider :familysearch, ENV['FAMILYSEARCH_DEVELOPER_KEY'], '',
           :client_options => { :site => 'https://sandbox.familysearch.org' }
end