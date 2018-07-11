OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '545104746945-7bhqcpsl2pm6jov6o28v5rjba9gemg2f.apps.googleusercontent.com', '3JIyqZ-OF1psYfZkABingog5', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
