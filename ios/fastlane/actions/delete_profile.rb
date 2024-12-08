# frozen_string_literal: true

module Fastlane
  module Actions
    module SharedValues
    end

    class DeleteProfileAction < Action
      def self.run(params)
        api_token = Spaceship::ConnectAPI::Token.from(hash: params[:api_key])

        UI.message("Fetching profiles: #{params[:provisioning_name]}.")

        url = URI.parse('https://api.appstoreconnect.apple.com/v1/profiles')
        url.query = URI.encode_www_form({ 'filter[name]' => params[:provisioning_name] })
        request = Net::HTTP::Get.new(url)
        request.add_field('Authorization', "Bearer #{api_token.text}")
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end
        id = JSON.parse(response.body)['data'].first['id']

        UI.message("Fetched profile. code: #{response.code}, id: #{id}")

        if id.nil?
          UI.message('Profile not found.')
          return
        end

        UI.message("Deleting profile: #{params[:provisioning_name]}.")

        url = URI.parse("https://api.appstoreconnect.apple.com/v1/profiles/#{id}")
        request = Net::HTTP::Delete.new(url)
        request.add_field('Authorization', "Bearer #{api_token.text}")
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end

        UI.success("Profile deleted. Response. code: #{response.code}")
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Delete Profile'
      end

      def self.details
        'Delete Profile'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :api_key,
            env_names: %w[SIGH_API_KEY APP_STORE_CONNECT_API_KEY],
            description: 'Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option)',
            type: Hash,
            sensitive: true
          ),
          FastlaneCore::ConfigItem.new(
            key: :provisioning_name,
            env_name: 'SIGH_PROVISIONING_PROFILE_NAME',
            description: 'The name of the profile that is used on the Apple Developer Portal'
          )
        ]
      end

      def self.output; end

      def self.return_value; end

      def self.authors
        ['Your GitHub/Twitter Name']
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
