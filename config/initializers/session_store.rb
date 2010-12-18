# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_arsbbs_session',
  :secret      => '9f19fdeb11a98ed71d876bcb6e30a1f659a85655507d3ed1082b1feeb5760625f0e26db61a2091d396955f0ef2e5f37e052501f1061a8a7d8a94681368b3de9d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
