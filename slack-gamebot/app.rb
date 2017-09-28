module SlackGamebot
  class App < SlackRubyBotServer::App
    DEAD_MESSAGE = <<-EOS
This leaderboard has been dead for over a month, deactivating.
Re-install the bot at https://www.playplay.io. Your data will be purged in 2 weeks.
EOS

    def prepare!
      super
      update_unbalanced_teams!
    end

    private

    def update_unbalanced_teams!
      Team.where(unbalanced: nil).update_all(unbalanced: false)
    end
  end
end
