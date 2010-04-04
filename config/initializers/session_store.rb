# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blogstain_session',
  :secret      => '8f32306e5017caec964d039ddb6f9d7fb6408a6634aaab87d72f10ee8b4c42f6e5006df4b1324c483580121d31852b5b9bf9865eb04037d051958e2b599ab6b3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
