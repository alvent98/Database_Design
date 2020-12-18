Use Camp

/*Important stuff starts here*/

Insert into Staff(staffNo, staffName, staffSurname)
(Select distinct(staffNo), staffName, staffSurname from MainTable);

Insert into Payment(payCode, payMethod)
(Select distinct(payCode), payMethod from MainTable);

Insert into Customer(custCode, custName, custSurname, custPhone)
(Select distinct(custCode), custName, custSurname, custPhone from MainTable);

Insert into Category(catCode, areaM2, unitCost)
(Select distinct(catCode), areaM2, unitCost from MainTable);

Insert into Camping(campCode, campName, numOfEmp)
(Select distinct(campCode), campName, numOfEmp from MainTable);

Insert into Booking(bookCode, bookDt, payCode, custCode, staffNo)
(Select distinct(bookCode), bookDt, Payment.payCode, Customer.custCode, Staff.staffNo 
from MainTable, Payment, Customer,Staff
where Payment.payCode= MainTable.payCode and Customer.custCode = MainTable.custCode
and Staff.staffNo = MainTable.staffNo);

Insert into Emplacement(campCode, empNo, catCode)
(Select distinct(Camping.campCode), empNo, Category.catCode 
from MainTable, Camping, Category
where Camping.campCode= MainTable.campCode and Category.catCode = MainTable.catCode);

Insert into Rental(bookCode, campCode, empNo,startDt,endDt,noPers)
(Select distinct(Booking.bookCode),Emplacement.campCode, Emplacement.empNo,startDt,endDt,noPers
from MainTable, Booking, Emplacement
where Booking.bookCode= MainTable.bookCode and Emplacement.campCode = MainTable.campCode
and Emplacement.empNo = MainTable.empNo);

/*Important stuff ends here*/

Select* from MainTable;

Select count(distinct(staffNo)) from Staff;
Select count(distinct(payCode)) from MainTable;

Select* from Emplacement;

Select distinct(campCode) from Emplacement;

Select count(distinct(empNo)) from Emplacement where campCode='ROS';

Select count(empNo) from Emplacement where campCode='ROS';