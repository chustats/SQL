select h.hacker_id, h.name, count(c.challenge_id) as cnt from hackers as h
inner join challenges as c
on h.hacker_id = c.hacker_id 
group by h.hacker_id, h.name
having cnt = (select count(challenge_id) from  challenges
             group by hacker_id 
             order by count(challenge_id) desc limit 1)
or cnt in
(select newset.cnt2 from 
(select count(challenge_id) as cnt2 from challenges
 group by hacker_id) newset
group by newset.cnt2 
 having count(newset.cnt2) =1)
             
order by cnt desc, h.hacker_id; 
