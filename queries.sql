#1 find the travel guide's name that the agency has used for German destinations
SELECT e.name , e.surname
FROM employees e, guided_tour g, tourist_attraction ta, destination d
WHERE e.employees_AM = g.travel_guide_employee_AM
  and g.tourist_attraction_id = ta.tourist_attraction_id
  and ta.destination_destination_id = d.destination_id
  and d.country = 'Germany'
group by e.name , e.surname;



# 2 Find the number of employees each travel agency branch has.
SELECT t.travel_agency_branch_id, count(t.travel_agency_branch_id) AS "Number of employees"
FROM employees e, travel_agency_branch t
WHERE t.travel_agency_branch_id = e.travel_agency_branch_travel_agency_branch_id
group by t.travel_agency_branch_id;



#3 Find the guides who have conducted all tours in the same language.
SELECT  e.name, e.surname
from employees e, guided_tour tour
where e.employees_AM = tour.travel_guide_employee_AM
group by e.employees_AM
having count(distinct tour.travel_guide_language_id) = 1;


#4 Find all male travelers who are 40 years old or older and have made reservations for more than 3 travel packages.
SELECT t.name, t.surname
FROM traveler t, reservation r,trip_package tr
WHERE t.age >= 40 and t.gender = 'male' and t.traveler_id = r.Customer_id and r.offer_trip_package_id = tr.trip_package_id
group by t.name, t.surname
having count(r.Reservation_id) > 3;



#5 Find the country of the "destination" that is included in more travel packages than any other.
SELECT d.country
FROM destination d
WHERE (SELECT count(distinct td.trip_package_trip_package_id)
    FROM trip_package_has_destination td
    WHERE td.destination_destination_id = d.destination_id) >= ALL (SELECT count(distinct td.trip_package_trip_package_id)
																	FROM trip_package_has_destination td
																	group by td.destination_destination_id);



from trip_package t, trip_package_has_destination td, destination d
where t.trip_package_id = td.trip_package_trip_package_id
and td.destination_destination_id = d.destination_id
and d.country = 'ireland' 
group by t.trip_package_id
having count(distinct d.destination_id) = 5;
