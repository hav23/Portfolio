use itcoursesdb;
-- Inner join
select firstname, lastname, coursename
from user as u
inner join usercourse as uc
on u.id=uc.userid
inner join course as c
on uc.courseid=c.id;
-- links the primary data with the secondary data where data references exist.
-- left join
select firstname, lastname, coursename
from user as u
left join usercourse as uc
on u.id=uc.userid
left join course as c
on c.id=uc.courseid order by lastname, firstname;
-- checks primary entity for links to second entity
-- right join
select coursename, firstname, lastname
from user as u
right join usercourse as uc
on u.id=uc.userid
right join course as c
on c.id=uc.courseid order by lastname, firstname;
-- checks secondary entity for links to primary entity