/* Different situation vs goal conversion*/
Select situation, count(*) as total_shots,
		count(case when result='Goal' then 1 end) as total_goals,
		count(case when result='Goal' then 1 end)*100/count(*) as goal_conversion_rate
from salah_shots
group by situation
order by goal_conversion_rate desc


/* Best part of the match to make a goal*/
Select case
			when minute <= 15 then '0-15'
			when minute <= 30 then '16-30'
			when minute <= 45 then '31-45'
			when minute <= 60 then '46-60'
			when minute <= 75 then '61-75'
			when minute <= 90 then '76-90'
			else '76-90+'
		end as match_period,
		AVG(xg) as average_xg,
		count(*) as total_shots
from salah_shots
group by match_period
order by average_xg desc
		

/* Sectors of the pitch*/
Select case
			when "X"<0.3 then 'Long'
			when "X" Between 0.3 and 0.6 THEN 'Penalty area'
			Else 'Close to goal'
		End as shot_zone,
		count(*) as total_shots,
		avg(xg) as average_xg
from salah_shots
group by shot_zone
order by average_xg desc
		