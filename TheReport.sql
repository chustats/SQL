select case when g.grade >= 8 then s.name
            else NULL end as name,
 g.grade, s.marks from students as s
inner join grades as g on (s.marks <= g.max_mark and s.marks >= g.min_mark)
order by g.grade desc, name asc, s.marks asc;
