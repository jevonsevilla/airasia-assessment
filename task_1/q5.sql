select BookingCustomerEmailAddress, PassengerID, avg(RevenueAmount) as AverageRevenue
from airline_bookings
where RevenueType like 'Ancillary'
group by BookingCustomerEmailAddress, PassengerID