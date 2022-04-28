with roundtrips_per_booking as (
    select BookingCustomerEmailAddress, BookingID, count(distinct PassengerID) as n_Rountrips
    from airline_bookings
    where TripType like 'RoundTrip'
    group by BookingID, BookingCustomerEmailAddress),

with oneways_per_booking as (
    select BookingCustomerEmailAddress, BookingID, count(distinct PassengerID) as n_Oneways
    from airline_bookings
    where TripType like 'Oneway'
    group by BookingID, BookingCustomerEmailAddress),

with total_roundtrips as (
    select BookingCustomerEmailAddress, sum(n_Rountrips) as sum_Roundtrips
    from roundtrips_per_booking
    group by BookingCustomerEmailAddress),

with total_oneways as (
    select BookingCustomerEmailAddress, sum(n_Oneways) as sum_Oneways
    from oneways_per_booking
    group by BookingCustomerEmailAddress),

with both_types as (
    select a.BookingCustomerEmailAddress, a.sum_Roundtrips, b.sum_Oneways
    from total_roundtrips a
    inner join total_oneways b
    on a.BookingCustomerEmailAddress = b.BookingCustomerEmailAddress)

select sum_Roundtrips/(sum_Oneways + sum_Roundtrips) as PercentRoundtrip
from both_types