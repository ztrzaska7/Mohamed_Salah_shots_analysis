/* average xG*/
Select avg(xg)
from salah_shots


Select shotType,avg(xg)
from salah_shots
group by shotType
order by avg(xg)

Select shotType,count(shotType) as part_of_goals
from salah_shots
group by shotType
order by part_of_goals desc

/* Which season was the best for Mo Salah*/
Select season, count(*) as goals
from salah_shots
group by season
order by goals

/* shot accuracy*/
Select Count(CASE WHEN result = 'Goal' THEN 1 END)*100.0/COUNT(*) as shot_accuracy
from salah_shots
