namespace :dynamodb_tables do
  desc "bundle exec rake dynamodb_tables_v1:create_messages_table RAILS_ENV=<ENV>"
  task :create_messages_table => :environment do
    puts "Creating activities table in #{Rails.env}\n"

    create_messages_table

    puts "Completed task\n"
  end

  def create_messages_table

    params = {
        table_name: 'messages',
        key_schema: [
          {
            attribute_name: 'user_id',
            key_type: 'HASH'
          },
          {
            attribute_name: 'message_id',
            key_type: 'RANGE'
          }
        ],
        attribute_definitions: [
          {
            attribute_name: 'user_id',
            attribute_type: 'S',
          },
          {
            attribute_name: 'message_id',
            attribute_type: 'S'
          }
        ],

        provisioned_throughput: {
          read_capacity_units: 5,
          write_capacity_units: 5
        }
    }

    begin
      result = DynamodbClient.client.create_table(params)
      puts 'Created table: activities. Status: ' + result.table_description.table_status;
    rescue Aws::DynamoDB::Errors::ServiceError => error
      puts 'Unable to create table: activities\n'
      puts "#{error.message}"
    end
  end
end
