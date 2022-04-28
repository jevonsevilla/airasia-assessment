with passengers_per_booking as (
    select BookingCustomerEmailAddress, BookingID, count(distinct PassengerID) as GroupSize
    from airline_bookings
    group by BookingCustomerEmailAddress, BookingID)
    
select BookingCustomerEmailAddress, sum(GroupSize) as TotalPassengers
from passengers_per_booking
group by BookingCustomerEmailAddress


