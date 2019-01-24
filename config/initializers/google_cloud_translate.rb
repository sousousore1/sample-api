require "google/cloud/translate"

Google::Cloud::Translate.configure do |config|
  config.project_id  = Rails.application.credentials.gcp_project_id
  config.credentials = Rails.application.credentials.gcp_credentials
end
