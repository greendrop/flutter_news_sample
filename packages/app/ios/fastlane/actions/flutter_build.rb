# frozen_string_literal: true

module Fastlane
  module Actions
    module SharedValues
    end

    class FlutterBuildAction < Action
      def self.run(params)
        require 'open3'

        cmd = "flutter build #{params[:arg]}"
        output, status = Open3.capture2e(cmd, chdir: '..')

        UI.message(output)

        raise "FAILED. Exit Code: #{status.exitstatus}." if status.exitstatus != 0
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Run Flutter Build'
      end

      def self.details
        'Run Flutter Build'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :arg,
            env_name: 'FL_FLUTTER_BUILD_ARG',
            description: 'Arg for FlutterBuildAction',
            verify_block: proc do |value|
              unless value && !value.empty?
                UI.user_error!("No arg for FlutterBuildAction given, pass using `arg: 'arg'`")
              end
            end
          )
        ]
      end

      def self.output; end

      def self.return_value; end

      def self.authors
        ['Your GitHub/Twitter Name']
      end

      def self.is_supported?(platform)
        %i[android ios].include?(platform)
      end
    end
  end
end
