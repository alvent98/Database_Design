use Camp;

/*Important stuff starts here*/
/*4a*/
select count(bookCode) AS NumOfPayments, Payment.payMethod from Booking, Payment 
where Payment.payCode = Booking.payCode group by Payment.payMethod;

/*4b success optimized*/
select count(Booking.staffNo) AS NumOfBookings,Staff.staffName, Staff.staffSurname, Staff.staffNo INTO tempStaffProductivity FROM Booking,Staff 
where Booking.staffNo=Staff.staffNo group by Staff.staffNo,Staff.staffName, Staff.staffSurname;

select NumOfBookings,staffName, staffSurname from tempStaffProductivity where NumOfBookings = (Select max(NumOfBookings) from tempStaffProductivity);

drop table tempStaffProductivity;

/*4c*/
select count(Rental.bookCode) As NumOfBookingsWithOnlyA from Rental,Booking,Emplacement,Category
where Rental.bookCode=Booking.bookCode and Rental.campCode = Emplacement.campCode
and  Emplacement.catCode = Category.catCode and Emplacement.empNo = Rental.empNo 
and Emplacement.catCode='A';

/*4d*/
select count(Booking.custCode) as NumOfBookingsIn2000,Customer.custName, Customer.custSurname 
from Booking,Customer
where Booking.custCode=Customer.custCode and Booking.bookDt like '2000%' 
group by Customer.custSurname, Customer.custName order by Customer.custSurname;

/*4e*/
SELECT sum(unitCost*(DATEDIFF(day,startDt,endDt)+1)*noPers) as totalIncome,Camping.campName 
from Booking, Camping, Category, Emplacement, Rental
where Emplacement.catCode = Category.catCode and Emplacement.campCode = Camping.campCode
and Booking.bookCode = Rental.bookCode and Emplacement.campCode = Rental.campCode 
and Emplacement.empNo = Rental.empNo
group by Camping.campCode, Camping.campName;

/*Important stuff ends here*/

select count(Booking.staffNo) FROM Booking
 group by Booking.staffNo order by count(Booking.staffNo) desc;

select count(Booking.staffNo) from Booking,Staff 
where Staff.staffNo=Booking.staffNo and Staff.staffSurname = 'GALL';

select count(bookCode) from Booking;

Select count(Booking.bookCode) from Booking;

select * from Booking;

    select Booking.bookDt,Customer.custName, Customer.custSurname from Booking,Customer
    where Booking.custCode=Customer.custCode and Booking.bookDt like '2000%' 
    and Customer.custSurname = 'ABBOTT';    

SELECT DATEDIFF(day, '2017/08/25','2017/08/27') AS DateDiff; 