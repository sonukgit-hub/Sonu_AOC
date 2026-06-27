@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Processor Projection'
@Metadata.allowExtensions: true
define view entity ZECL_SK_BOOKING_PROCESSOR1 as projection on ZECL_SK_BOOKING1
{
    key TravelId,
    key BookingId,
    BookingDate,
    @Consumption.valueHelpDefinition: [{  
                 entity.name: '/DMO/I_Customer',
                 entity.element: 'CustomerID'
    }]
    CustomerId,
    @Consumption.valueHelpDefinition: [{  
                 entity.name: '/DMO/I_Carrier',
                 entity.element: 'AirlineID'
    }]
    CarrierId,
    @Consumption.valueHelpDefinition: [{  
                 entity.name: '/DMO/I_Connection',
                 entity.element: 'ConnectionID',
                 additionalBinding: [{ localElement: 'CarrierId',
                                       element: 'AirlineID' }]
    }]
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingStatus,
    _Carrier,
    _Connection,
    _Customer,
    _Travel :redirected to parent ZECL_SK_TRAVEL_PROCESSOR1
}
