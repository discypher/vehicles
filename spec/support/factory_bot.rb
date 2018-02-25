RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

# This is slow, as it hits the database for each association
def build_attributes(*args)
  FactoryBot.build(*args).attributes.delete_if do |k, v|
    ["id", "created_at", "updated_at"].member?(k)
  end
end
