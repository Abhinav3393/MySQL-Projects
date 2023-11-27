select * from matches;
select * from players;
select * from teams;

-- 1. What are the names of the players whose salary is greater than 100,000?
select player_name, salary
from players
where salary > 100000;

-- 2. What is the team name of the player with player_id = 3?
select team_name
from teams t
join players p
	on t.team_id = p.team_id
where p.player_id = 3;

-- 3. What is the total number of players in each team?
select t.team_name,
	   count(p.player_id) as count_of_players
from teams t
	join players p
		on t.team_id = p.team_id
group by t.team_name
order by count_of_players;

-- 4. What is the team name and captain name of the team with team_id = 2?
select t.team_name,
       p.player_name as captain_name
from teams t
join players p
	on t.captain_id = p.player_id
where t.team_id = 2;

-- 5. What are the player names and their roles in the team with team_id = 1?
select p.player_name,
	   p.role as player_role
from players p
	join teams t
		on p.team_id = t.team_id
where p.team_id = 1;

-- 6. What are the team names and the number of matches they have won?
select team_name,
	count(winner_id) as no_of_matches_won
from teams t
	join matches m
		on t.team_id = m.winner_id
group by team_name
order by no_of_matches_won desc;

-- 7. What is the average salary of players in the teams with country 'USA'?
-- select player_name,
-- 	   round(avg(salary), 2) as average_salary
-- from players p
-- 	join teams t
-- 		on p.team_id = t.team_id
-- where country = "USA"
-- group by player_name;

select team_name,
	   round(avg(salary), 2) as average_salary
from teams t
	join players p
		on p.team_id = t.team_id
where country = "USA"
group by team_name;

-- 8. Which team won the most matches?
select team_name,
	   count(winner_id) as most_matches_won
from teams t
	join matches m
		on t.team_id = m.winner_id
group by team_name
order by most_matches_won desc
limit 1;

-- 9. What are the team names and the number of players in each team whose salary is greater than 100,000?
select team_name,
	   count(player_id) as no_of_players
from teams t
	join players p
		on t.team_id = p.team_id
where salary > 100000
group by team_name
order by no_of_players desc;

-- 10. What is the date and the score of the match with match_id = 3?
select match_date,
       score_team1,
       score_team2,
       (score_team1 + score_team2) as Total_Score
from matches
where match_id = 3;