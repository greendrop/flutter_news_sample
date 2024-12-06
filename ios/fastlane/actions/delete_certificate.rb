module Fastlane
  module Actions
    module SharedValues
      # DELETE_CERTIFICATE_CUSTOM_VALUE = :DELETE_CERTIFICATE_CUSTOM_VALUE
    end

    class DeleteCertificateAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        # UI.message("Parameter API Token: #{params[:api_token]}")

        # sh "shellcommand ./path"

        # Actions.lane_context[SharedValues::DELETE_CERTIFICATE_CUSTOM_VALUE] = "my_val"

        api_token = Spaceship::ConnectAPI::Token.from(hash: params[:api_key])

        UI.message("Deleting certificate: #{params[:certificate_id]}")

        url = URI.parse("https://api.appstoreconnect.apple.com/v1/certificates/#{params[:certificate_id]}")
        request = Net::HTTP::Delete.new(url)
        request.add_field("Authorization", "Bearer #{api_token.text}")
        response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
          http.request(request)
        end

        UI.success("Certificate deleted. Response code: #{response.code}")
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        # 'A short description with <= 80 characters of what this action does'
        "Delete Certificate"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        # 'You can use this action to do cool things...'
        "Delete Certificate"
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        # [
        #   FastlaneCore::ConfigItem.new(key: :api_token,
        #                                # The name of the environment variable
        #                                env_name: 'FL_DELETE_CERTIFICATE_API_TOKEN',
        #                                # a short description of this parameter
        #                                description: 'API Token for DeleteCertificateAction',
        #                                verify_block: proc do |value|
        #                                  unless value && !value.empty?
        #                                    UI.user_error!("No API token for DeleteCertificateAction given, pass using `api_token: 'token'`")
        #                                  end
        #                                  # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
        #                                end),
        #   FastlaneCore::ConfigItem.new(key: :development,
        #                                env_name: 'FL_DELETE_CERTIFICATE_DEVELOPMENT',
        #                                description: 'Create a development certificate instead of a distribution one',
        #                                # true: verifies the input is a string, false: every kind of value
        #                                is_string: false,
        #                                # the default value if the user didn't provide one
        #                                default_value: false)
        # ]
        [
          FastlaneCore::ConfigItem.new(key: :api_key,
                                       env_names: ["CERT_API_KEY", "DELIVER_API_KEY", "APP_STORE_CONNECT_API_KEY"],
                                       description: "Your App Store Connect API Key information (https://docs.fastlane.tools/app-store-connect-api/#using-fastlane-api-key-hash-option)",
                                       type: Hash,
                                       sensitive: true),
          FastlaneCore::ConfigItem.new(key: :certificate_id,
                                      env_name: "CERT_CERTIFICATE_ID",
                                      description: "Cert Certificate ID"),
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        # [
        #   ['DELETE_CERTIFICATE_CUSTOM_VALUE', 'A description of what this value contains']
        # ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ['Your GitHub/Twitter Name']
      end

      def self.is_supported?(platform)
        # you can do things like
        #
        #  true
        #
        #  platform == :ios
        #
        #  [:ios, :mac].include?(platform)
        #

        platform == :ios
      end
    end
  end
end
