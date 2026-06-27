@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root View for RAP BO'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZECL_SK_TRAVEL1 as select from /dmo/travel_m
composition[0..*] of ZECL_SK_BOOKING1 as _Booking
association[1] to /DMO/I_Agency as _Agency on
$projection.AgencyId = _Agency.AgencyID
association[1] to /DMO/I_Customer as _Customer on
$projection.CustomerId = _Customer.CustomerID
association[1] to I_Currency as _Currency on
$projection.CurrencyCode = _Currency.Currency
association[1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on
$projection.OverallStatus = _OverallStatus.OverallStatus
association[1..*] to ZECL_SK_BOOKSUPPL as _BookingSuppl on 
$projection.TravelId = _BookingSuppl.TravelId


{
    
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as OverallStatus,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    case overall_status
    when 'N' then 'New'
    when 'B' then 'Booked'
    when 'P' then 'Planned'
    when 'X' then 'Cancelled'
    end as Status_Text,
    case overall_status
    when 'N' then 2
    when 'B' then 3
    when 'P' then 1
    when 'X' then 1
    end as Criticality,
    _Agency,
    _Customer,
    _Currency,
    _OverallStatus,
    _Booking
   
    
}
