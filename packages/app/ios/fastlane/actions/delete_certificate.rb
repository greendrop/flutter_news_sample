# frozen_string_literal: true

module Fastlane
  module Actions
    module SharedValues
    end

    class DeleteCertificateAction < Action
      def self.run(params)
        api_token = Spaceship::ConnectAPI::Token.from(hash: params[:api_key])

        UI.message("Deleting certificate: #{params[:certificate_id]}")

        url = URI.parse("https://api.appstoreconnect.apple.com/v1/certificates/#{params[:certificate_id]}")
        request = Net::HTTP::Delete.new(url)
        request.add_field('Authorization', "Bearer #{api_token.text}")
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end

        UI.success("Certificate deleted. Response code: #{response.code}")
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Delete Certificate'
      end

      def self.details
        'Delete Certificate'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       env_names: %w[CERT_API_KEY DELIVER_API_KEY APP_STORE_CONNECT_API_KEY],
                                       description: 'Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option)',
                                       type: Hash,
                                       sensitive: true),
          FastlaneCore::ConfigItem.new(key: :certificate_id,
                                       env_name: 'CERT_CERTIFICATE_ID',
                                       description: 'Cert Certificate ID')
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
