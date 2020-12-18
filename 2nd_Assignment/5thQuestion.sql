/*4d*/
CREATE INDEX CustomerSurname ON Customer(custSurname);

select count(Booking.custCode) as NumOfBookingsIn2000,Customer.custName, Customer.custSurname 
from Booking,Customer
where Booking.custCode=Customer.custCode and Booking.bookDt like '2000%' 
group by Customer.custSurname, Customer.custName order by Customer.custSurname;

drop INDEX CustomerSurname;

/*4e*/
Create index CampNamesIndex on Camping(campName);
Create index EmplacementsIndex on Emplacement(empNo,campCode);
Create index EmplacementsInRentalsIndex on Rental(empNo,campCode);
SELECT sum(unitCost*(DATEDIFF(day,startDt,endDt)+1)*noPers) as totalIncome,Camping.campName 
from Booking, Camping, Category, Emplacement, Rental
where Emplacement.catCode = Category.catCode and Emplacement.campCode = Camping.campCode
and Booking.bookCode = Rental.bookCode and Emplacement.campCode = Rental.campCode 
and Emplacement.empNo = Rental.empNo
group by Camping.campCode, Camping.campName;

Drop index CampNamesIndex on Camping;
Drop index EmplacementsIndex on Emplacement;
Drop index EmplacementsInRentalsIndex on Rental;