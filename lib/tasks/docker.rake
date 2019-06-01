namespace :docker do
  desc "Creates and pull the image to DockerHub"
  task push_image: :environment do
    TAG = `git rev-parse --short HEAD`.strip

    puts "Building Docker image"
    sh "docker build -t andreleoni/inbox-ms:#{TAG} ."

    IMAGE_ID = `docker images | grep andreleoni\/inbox-ms | head -n1 | awk '{print $3}'`.strip

    puts "Tagging latest image"
    sh "docker tag #{IMAGE_ID} andreleoni/inbox-ms:latest"

    puts "Pushing Docker image"
    sh "docker push andreleoni/inbox-ms:#{TAG}"
    sh "docker push andreleoni/inbox-ms:latest"

    puts "Done"
  end
end
