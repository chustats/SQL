select h.hacker_id, h.name, sum(score) as total_score
from
hackers as h inner join
/* find max_score*/
(select hacker_id,  max(score) as score from submissions group by hacker_id, challenge_id) as max_score

on h.hacker_id=max_score.hacker_id
group by h.hacker_id, h.name

/* don't accept hackers with total_score=0 */
having total_score > 0

/* finally order as required */
order by total_score desc, h.hacker_id
;
