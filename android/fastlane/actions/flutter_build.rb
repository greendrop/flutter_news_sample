module Fastlane
  module Actions
    module SharedValues
      # FLUTTER_BUILD_CUSTOM_VALUE = :FLUTTER_BUILD_CUSTOM_VALUE
    end

    class FlutterBuildAction < Action
      def self.run(params)
        # fastlane will take care of reading in the parameter and fetching the environment variable:
        # UI.message("Parameter API Token: #{params[:api_token]}")

        # sh "shellcommand ./path"

        # Actions.lane_context[SharedValues::FLUTTER_BUILD_CUSTOM_VALUE] = "my_val"

        require 'open3'

        cmd = "flutter build #{params[:arg]}"
        output, status = Open3.capture2e(cmd, chdir: "..")

        UI.message(output)

        raise "FAILED. Exit Code: #{status.exitstatus}." if status.exitstatus != 0
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        # 'A short description with <= 80 characters of what this action does'
        "Run Flutter Build"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        # 'A short description with <= 80 characters of what this action does'
        "Run Flutter Build"
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        # [
        #   FastlaneCore::ConfigItem.new(key: :api_token,
        #                                # The name of the environment variable
        #                                env_name: 'FL_FLUTTER_BUILD_API_TOKEN',
        #                                # a short description of this parameter
        #                                description: 'API Token for FlutterBuildAction',
        #                                verify_block: proc do |value|
        #                                  unless value && !value.empty?
        #                                    UI.user_error!("No API token for FlutterBuildAction given, pass using `api_token: 'token'`")
        #                                  end
        #                                  # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
        #                                end),
        #   FastlaneCore::ConfigItem.new(key: :development,
        #                                env_name: 'FL_FLUTTER_BUILD_DEVELOPMENT',
        #                                description: 'Create a development certificate instead of a distribution one',
        #                                # true: verifies the input is a string, false: every kind of value
        #                                is_string: false,
        #                                # the default value if the user didn't provide one
        #                                default_value: false)
        # ],
        [
          FastlaneCore::ConfigItem.new(key: :arg,
                                       env_name: 'FL_FLUTTER_BUILD_ARG',
                                       description: 'Arg for FlutterBuildAction',
                                       verify_block: proc do |value|
                                         unless value && !value.empty?
                                           UI.user_error!("No arg for FlutterBuildAction given, pass using `arg: 'arg'`")
                                         end
                                       end),
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        # [
        #   ['FLUTTER_BUILD_CUSTOM_VALUE', 'A description of what this value contains']
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

        [:android, :ios].include?(platform)
      end
    end
  end
end
