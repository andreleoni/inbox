module DynamodbClient
  module_function

  def client
    client_config =
      if Rails.env.development?
        {
            region: 'us-west-2',
            endpoint: 'http://dynamodb:8000'
        }
      else
        {
            access_key_id: Rails.application.secrets.dynamodb_access_key_id,
            secret_access_key: Rails.application.secrets.dynamodb_secret_access_key,
            region: Rails.application.secrets.dynamodb_region
        }
      end

    Aws.config.update(
      region: 'us-west-2',
      credentials: Aws::Credentials.new('akid', 'secret'),
      endpoint:'http://dynamodb:8000'
    )

    @client ||= Aws::DynamoDB::Client.new(client_config)
  end
end
