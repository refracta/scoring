<%
   import query, loaddb, html, time, nemchoice
   c = attributes['cursor']

   title = "Crawl Tournament Leaderboard 2009"
   top_scores = query.find_games(c, sort_max='score', limit=3)

   cnemelex = nemchoice.current_nemelex_choice()
   pnemelex = nemchoice.previous_nemelex_choices()
%>

<html>
  <head>
    <title>${title}</title>
    <link rel="stylesheet" type="text/css" href="tourney-score.css"/>
  </head>
  <body class="page_back">
    <div class="page">
      <%include file="toplink.mako"/>
      <div class="page_content">
        <div class="heading">
          <h1>${title}</h1>
          <p class="fineprint">
            Tournament starts Aug 1, 2009 at midnight UTC, and ends on
            Sep 1, 2009 at midnight UTC.
          </p>
        </div>
        <hr/>

        <div class="content">

          % if cnemelex:
          <div class="row nemelex">
            <table class="grouping" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                  <h3>Nemelex' Choice: </h3>
                  <span>${cnemelex[0]}</span>, chosen on ${cnemelex[1]} UTC
                  <p class="fineprint">
                    100 bonus points for any player winning a ${cnemelex[0]}
                    during the tournament! Only your first
                    winning ${cnemelex[0]} counts.
                  </p>

                  % if pnemelex:
                  <h3>Nemelex' Previous Choices: </h3>
                  ${", ".join(['<span>' + x + '</span>' for x in pnemelex])}
                  % endif
                </td>

                <td>
                  ${html.banner_named('nemelex_choice')}
                </td>
              </tr>
            </table>
          </div>

          <hr/>
          % endif

          <div class="row">
	        <table class="grouping" cellpadding="0" cellspacing="0">
	          <tr>
                <!-- Column one -->
                <td>
                  <div>
                    <h3>Leading Players</h3>
	                <%include file="overall-scores.mako"/>
                  </div>
	            </td>

                <!-- Column two -->
	            <td>
                  <div>
	                <h3>Leading Clans</h3>
                    ${html.best_clans(c)}
                  </div>
	            </td>
       	      </tr>
	        </table>
          </div>

          <hr/>

          <div class="row">
            <div>
              <h3>Fastest win (turn count)</h3>
              <%include file="fastest-turn.mako"/>
            </div>
            <div>
              <h3>Fastest Win (real time)</h3>
              <%include file="fastest-time.mako"/>
            </div>

            <div>
              <h3>Top Scores</h3>
              ${html.games_table(top_scores)}
            </div>
          </div>

          <hr/>

          <div class="row">
            <div>
              <h3>First Victory</h3>
              <%include file="first-victory.mako"/>
            </div>
            <div>
	          <h3>First all-rune wins</h3>
	          <%include file="first-allrune.mako"/>
            </div>
          </div>

          <hr/>

          <div class="row">
            <div>
	          <h3>Longest Streak</h3>
              ${html.best_streaks(c)}
            </div>

            <div>
              <h3>Active Streaks</h3>
              ${html.best_active_streaks(c)}
            </div>
          </div>

          <hr/>

          <div class="row">
            <table class="grouping" cellspacing="0" cellpadding="0">
              <tr>
                <td>
                  <div>
                    <h3>Most High Scores</h3>
                    ${html.combo_highscorers(c)}
                  </div>
                </td>
                <td>
                  <div>
	                <h3>Most Uniques Killed</h3>
                    <%include file="most-uniques-killed.mako"/>
                  </div>
                </td>
              </tr>
            </table>
          </div>

          <hr/>

          <div class="row">
            <div>
              <h3>Ziggurat Raiders</h3>
              ${html.best_ziggurats(c)}
            </div>

            <div>
              <h3>Runes fetched at lowest XL</h3>
              ${html.youngest_rune_finds(c)}
              <p class="fineprint">
                Note: the abyssal rune is not eligible.
              </p>
            </div>

            <div>
	          <h3>Lowest DL at XL1</h3>
              ${html.deepest_xl1_games(c)}
            </div>

            <div>
              <h3>Most Deaths to Uniques</h3>
              ${html.most_deaths_to_uniques(c)}
            </div>
          </div>

          <hr/>

          <div class="row">
	        <table class="grouping" cellpadding="0" cellspacing="0">
              <tr>
                <td>
                  <div>
	                <h3>Most High Scores: Clan</h3>
                    ${html.clan_combo_highscores(c)}
                  </div>
	            </td>

	            <td>
                  <div>
	                <h3>Most Uniques Killed: Clan</h3>
                    ${html.clan_unique_kills(c)}
                  </div>
	            </td>
              </tr>
            </table>
          </div>
        </div> <!-- Content -->
      </div>
    </div>
    ${html.update_time()}
  </body>
</html>
