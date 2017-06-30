Slack-Gamebot
=============
## Usage

Start talking to your bot! All commands can be addressed to the bot's username, pp, or :pingpong: (any aliases)

![](screenshots/hi.png)

### Commands

#### pp

Shows GameBot version and links.

#### pp hi

Politely says 'hi' back.

#### pp help

Get help.

#### pp sucks

You can tell the bot that it sucks. But it will talk back.

![](screenshots/sucks.gif)

#### pp register

Registers a user.

![](screenshots/register.gif)

This command can also update a user's registration, for example after the user has been renamed. The bot notices user renames, but this may be necessary if the bot wasn't running during that operation.

```
pp register

Welcome back Victor Barna! I've updated your registration.
```

You can also remove yourself from the leaderboard with `pp unregister me` and re-register youself again with `pp register`.
The data is not removed, but the user will no longer appear in the leaderboards and cannot participate in challenges.

#### pp challenge &lt;opponent&gt; ... [with &lt;teammate&gt; ...]

Creates a new challenge between you and an opponent.

```
pp challenge @WangHoe

Victor Barna challenged Wang Hoe to a match!
```

You can create group challenges, too. Both sides must have the same number of players.

```
pp challenge @WangHoe @ZhangJike with @DengYaping

Victor Barna and Deng Yaping challenged Wang Hoe and Zhang Jike to a match!
```

#### pp accept

Accept a challenge.

```
pp accept

Wang Hoe and Zhang Jike accepted Victor Barna and Deng Yaping's challenge.
```

#### pp lost [to &lt;opponent&gt; [with &lt;teammate&gt;]] [score ...]

Record your loss.

![](screenshots/lost.gif)

You cannot record a win.

Record your loss with a score, loser first.

```
pp lost 5:21

Match has been recorded! Wang Hoe crushed Victor Barna with the score of 21:5.
```

You can record scores for an entire match.

```
pp lost 15:21 21:17 18:21

Match has been recorded! Wang Hoe defeated Victor Barna with the scores of 21:15 17:21 21:18.
```

You can record scores for a match you have already lost.

```
pp lost

Match has been recorded! Wang Hoe defeated Victor Barna.

pp lost 15:21 21:17 18:21

Match scores have been updated! Wang Hoe defeated Victor Barna with the scores of 21:15 17:21 21:18.
```

You can record a loss without a challenge.

![](screenshots/lost_to.gif)

You can also record scores and record lost matches with multiple players.

```
pp lost to @WangHoe @ZhangJike with @DengYaping 5:21

Match has been recorded! Wang Hoe and Zhang Jike defeated Victor Barna and Deng Yaping with the score of 21:5.
```

#### pp draw [score ...]

Draws a challenge, records a tie. All other players will also have to draw to record a match.

```
pp draw

Match is a draw, waiting to hear from Victor Barna.

pp draw 2:2

Match has been recorded. Victor Barna tied with Zhang Jike with a score of 2:2.
```

#### pp resigned [to &lt;opponent&gt; [with &lt;teammate&gt;]]

Records your resignation, which is a special kind of `lost` without a score.

```
pp resigned

Match has been recorded! Victor Barna resigned against Wang Hoe.
```

![](screenshots/resigned.gif)

You can resign without a prior challenge.

```
pp resigned to WangHoe

Match has been recorded! Victor Barna resigned against Wang Hoe.
```

#### pp decline

Decline a challenge.

```
pp decline

Wang Hoe and Zhang Jike declined Victor Barna and Deng Yaping's challenge.
```

#### pp cancel

Cancel a challenge.

```
pp cancel

Victor Barna and Deng Yaping canceled a challenge against Wang Hoe and Zhang Jike.
```

#### pp leaderboard [number|infinity]

Get the leaderboard.

```
pp leaderboard

1. Victor Barna: 3 wins, 2 losses (elo: 148, lws: 5)
2. Deng Yaping: 1 win, 3 losses (elo: 24)
3. Wang Hoe: 0 wins, 1 loss (elo: -12)
```

The leaderboard contains 3 topmost players ranked by [Elo](http://en.wikipedia.org/wiki/Elo_rating_system), use _leaderboard 10_ or _leaderboard infinity_ to see 10 players or more, respectively. It also shows the longest winning (lws) and losing (lls) streaks of at least 3.

In case you want to see leaderboard in reverse order (which would be totally wrong but motivational for people at the bottom of leaderboard), specify a negative number or `-infinity`:

```
pp leaderboard -5

1. Wang Hoe: 0 wins, 1 loss (elo: -12)
2. Deng Yaping: 1 win, 3 losses (elo: 24)
3. Victor Barna: 3 wins, 2 losses (elo: 148, lws: 5)
```

#### pp matches [number|infinity]

Displays top 10 match totals in the current season.

```
pp matches

Victor Barna defeated Wang Hoe 3 times
Deng Yaping defeated Victor Barna once
```

You can also get match totals for specific players.

```
pp matches @WangHoe

Victor Barna defeated Wang Hoe 5 times
Wang Hoe defeated Deng Yaping twice
```

Use _matches 3_ to see top 3 matches o _matches inifinity_ to see all matches in the season.

#### pp challenges

Displays all outstanding (proposed and accepted) challenges.

#### pp rank [&lt;player&gt; ...]

Show the smallest range of ranks for a list of players.  If no user is specified, your rank is shown.

```
pp rank @WangHoe @DengYaping

2. Deng Yaping: 1 win, 3 losses (elo: 24)
3. Wang Hoe: 0 wins, 1 loss (elo: -12)
```

#### pp promote &lt;player&gt; ...

Promotes other users to captain. Must be a captain to do that. A captain is similar to an Admin.

```
pp promote @WangHoe @DengYaping

Victor Barna promoted Wang Hoe and Deng Yaping to captain.
```

#### pp demote me

Demotes from captain to a normal user. Must be a captain and the team must have other captains to do this.

```
pp demote me

Victor Barna is no longer captain.
```

#### pp team

Display current team's info, including captains.

```
pp team

Team _China_, captains Deng Yaping and Victor Barna.
```

#### pp reset &lt;team id|team name&gt;

Reset all users and pending challenges and start a new season. Must be a captain to do this and confirm by specifying the team ID or name.

```
pp reset china

Welcome to the new season!
```

#### pp season

Display current season's leader and game totals.

```
pp season

Current: Deng Yaping: 1 win, 0 losses (elo: 48), 1 game, 2 players
```

#### pp seasons

Display current season's leader, past seasons' winners and game totals.

```
pp seasons

Current: Deng Yaping: 1 win, 0 losses (elo: 48), 1 game, 2 players
2015-07-16: Wang Hoe: 28 wins, 19 losses (elo: 214), 206 games, 25 players
```

#### pp unregister &lt;player&gt;

Captains can remove users.

```
pp unregister @WangHoe

I've removed @WangHoe from the leaderboard.
```

#### pp set nickname [name]

Sets a nickname for display purposes.

```
pp set nickname John Doe
```

Unset a nickname.

```
pp unset nickname
```

Captains can set nicknames of users by using a Slack mention.

```
pp set nickname @WangHoe John Doe
```

Captains can unset nicknames, too.

```
pp unset nickname @WangHoe
```

#### pp set gifs on|off

Enable/disable GIFs for your team.

```
pp set gifs off

GIFs for team China are off.
```

![](screenshots/gifs.gif)

Using `unset gifs` is equivalent to `set gifs off`.

#### pp set elo [number]

Set and resets the base elo for new seasons. Default is 0.

```
pp set elo 1000
```

```
pp unset elo
```

#### pp set aliases &lt;alias|none&gt; ...

Set additional aliases for the bot. For example you could upload a custom emoji for :pong: and set an alias for it.

```
pp set aliases pp :pong:

Team China aliases are set to pp and :pong:.
```

![](screenshots/aliases.gif)

Remove all aliases with `unset aliases`.

#### pp set api on|off

Enable/disable team data in the public API for your team and displays team API URL.

```
pp set api on

API for team China is on!
http://www.playplay.io/api/teams/57224e65bc526eac95bfe316
```

```
pp unset api

API for team China is off.
```

#### pp set unbalanced on|off

Allow unbalanced challenges with different number of opponents.

```
pp set unbalanced on

Unbalanced challenges for team China are on!
```

## API

Slack-gamebot implements a Hypermedia API. Navigate to the application root to browse through available objects and methods. PlayPlay.io's Gamebot is [here](http://www.playplay.io/api), you can see [dblock's current ping-pong elo here](http://www.playplay.io/api/users/5543f64d6237640003000000).

A team captain must opt-in serving data via the API with `set api on`. The data served by the API includes team's Slack IDs, usernames and game stats.

![](screenshots/api.png)

We recommend [HyperClient](https://github.com/codegram/hyperclient) to query the API programmatically in Ruby.

## Contributing

This bot is built with [slack-ruby-bot-server](https://github.com/dblock/slack-ruby-bot-server). See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2015-2016, Daniel Doubrovkine, Artsy and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).
