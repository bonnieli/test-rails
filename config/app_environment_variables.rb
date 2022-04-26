if Rails.env.test?
    ENV['SESSION_SECRET'] = 'a-secret-key'
end
  
if Rails.env.development?
    ENV['SESSION_SECRET'] = 'a-secret-key'
end