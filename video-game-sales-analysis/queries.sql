-- best_selling_games
SELECT *
FROM game_sales
ORDER BY games_sold DESC
LIMIT 10;

-- critics_top_ten_years
SELECT gs.year,
   COUNT(*) AS num_games,
   ROUND(AVG(r.critic_score), 2) AS avg_critic_score
FROM game_sales AS gs
INNER JOIN reviews AS R
   ON gs.name = r.name
GROUP BY gs.year
HAVING COUNT(*) >= 4
ORDER BY avg_critic_score DESC
LIMIT 10;

-- golden_years
SELECT c.year,
   c.num_games,
   c.avg_critic_score,
   u.avg_user_score,
   c.avg_critic_score - u.avg_user_score AS diff
FROM critics_avg_year_rating AS c
INNER JOIN users_avg_year_rating AS u
   ON c.year = u.year
WHERE c.avg_critic_score > 9
   OR u.avg_user_score > 9
ORDER BY c.year ASC;
