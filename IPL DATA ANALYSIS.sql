#IPL DATA ANALYSIS #

use classes;
select* FROM matches;

select player_of_match, count(*) as awards_count
from matches  group by  player_of_match
 order by awards_count desc 
 limit 5;
 
 
 select season,winner as team, count(*) matches_won 
 from matches group by season,winner;
 
 
 select avg(strike_rate) as avgrage_strike_rate
 from(select batsman,(sum(total_runs)/count(ball))*100 as strike_rate
 from deliveries group by batsman) as batsman_stats;
 
 
 select batsman,(sum(total_runs)/count(ball))*100 as strike_rate
 from deliveries group by batsman;
 
 
 select batting_first, count(*) as matches_won
 from( select case when win_by_runs> 0 then team1 else team2 
 end as batting_first
 from matches where winner!="tie") as batting_first_teams group by batting_first;
 
 
 select batsman,(sum(batsman_runs)*100/count(*))
 as strike_rate
 from deliveries group by batsman
 having sum(batsman_runs)>=200
 order by strike_rate desc
 limit 5;
 
 
 select batsman,count(*) as total_dismissals
 from deliveries where bowler="SL Malinga"
 group by batsman;
 
 
 select batsman,count(*) as total_dismissals
 from deliveries where player_dismissed is not null 
 and bowler="SL Malinga"
 group by batsman;
 
 
select batsman,avg(case when batsman_runs=4 or batsman_runs=6
then 1 else 0 end)* 100 as average_boundiries
from deliveries group by batsman;

#8
select season,batting_team,avg(fours+sixes) as average
from(select season,match_id,batting_team,
sum(case when batsman_runs=4 then 1 else 0 end) as fours,
sum(case  when batsman_runs=6 then 1 else 0 end) as sixes
from deliveries,matches where deliveries.match_id= matches.id
group by season,match_id,batting_team) as team_boundries
group by season,batting_team;


select season,batting_team,max(total_runs) as higest_partnership
from(select season,batting_team,partnership, sum(total_runs) as total_runs
from(select season,match_id,batting_team,over_no,
sum(batsman_runs) as partnership,sum(batsman_runs)+sum(extra_runs) as total_runs
from( select deliveries,matches where deliveries.match_id=matches.id
group by season,match_id,batting_team,over_no) as team_scores
group by season,batting_team,partnership) as highest_partnership
group by season,batting_team;


select m.id as match_no,d.bowling_team,
sum(d.extra_runs) as extras
from matches as m
join deliveries as d
on d. match_id=m.id
where extra_runs>0
group by m.id,d.bowling_team;


select m.id as match_no,d.bowler,count(*) as wickets_taken
from matches as m
join deliveries as d on d.match_id=m.id
where d.player_dismissed is not null
group by m.id,d.bowler
order by wickets_taken desc
limit 5;


select m.city, case when m.team1=m.winner then m.team1
when m.team2=m.winner then m.team2
else "draw"
end as winning_team,
count(*) as wins
from matches as m
join deliveries as d on d.match_id=m.id
where m.result!="Tie"
group by m.city,winning_team;


select season,toss_winner,count(*) as toss_wins
from matches group by season,toss_winner;


select player_of_match,count(*) as total_wins
from matches
where player_of_match is not null
group by player_of_match
order by total_wins desc ;


select m.id,d.inning,d.over_no,
avg(d.total_runs) as average_runs_per_over
from matches as m
join deliveries as d on d.match_id=m.id
group by m.id,d.inning,d.over_no;


select m.season,m.id as match_no,d.batting_team,
sum(d.total_runs) as total_score
from matches as m
join deliveries as d on d.match_id=m.id
group by m.season,m.id,d.batting_team
order by total_score desc
limit 2;


select m.season,m.id as match_no,d.batsman,
sum(d.batsman_runs) as total_runs
from matches as m
join deliveries as d on d.match_id=m.id
group by m.season,m.id,d.batsman
order by total_runs desc
limit 2;