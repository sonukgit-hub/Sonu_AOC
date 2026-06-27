@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Processor Projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZECL_SK_TRAVEL_PROCESSOR1 
                           provider contract transactional_query 
                           as projection on ZECL_SK_TRAVEL1
{
        @ObjectModel.text.element: [ 'Description' ]
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{  
                 entity.name: '/dmo/I_Agency',
                 entity.element: 'AgencyID'
    }]
    AgencyId,
    @Semantics.text: true
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Semantics.text: true
    _Customer.LastName as CustomerName,
    @Consumption.valueHelpDefinition: [{  
                 entity.name: '/DMO/I_Customer',
                 entity.element: 'CustomerID'
    }]
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    @Consumption.valueHelpDefinition: [{  
                 entity.name: '/DMO/I_Travel_Status_VH',
                 entity.element: 'TravelStatus'
    }]
    @ObjectModel.text.element: [ 'Status_Text' ]
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    @Semantics.text: true
    Status_Text,
    Criticality,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child ZECL_SK_BOOKING_PROCESSOR1,
    _Currency,
    _Customer,
    _OverallStatus
   
}
