# softensity-challeger
Coding Challenge

#### Code Exercise We'd like to receive geospatial data from an external system and view it on our side. 

#### 1. Create a new application using the latest Ruby, Rails and Postgres. 

#### 2. Create an API controller which will accept a HTTP POST request containing a JSON string. See below for sample JSON. 

#### 3. Once the API is called from outside of the application, persist data in the database. 

Create 2 resources from the JSON: Ticket and Excavator. Ticket is the main object and Excavator belongs to Ticket. Attributes that should be persisted in the database for both objects are described below. Use Rails attribute naming conventions and appropriate data types. 

#### 4. Add a regular controller with index and show HTML views for the tickets with excavator data. 
#### 5. Plot DigsiteInfo->WellKnownText info on a map in the ticket show view. 
#### 6. Deploy your solution to render.com 

### Ticket attributes 
- RequestNumber 
- SequenceNumber 
- RequestType
- RequestAction
- DateTimes->ResponseDueDateTime
- ServiceArea->PrimaryServiceAreaCode->SACode - ServiceArea->AdditionalServiceAreaCodes->SACode 
- DigsiteInfo->WellKnownText 

### Excavator attributes 
- Excavator->CompanyName 
- Excavator->Address (full address including city, zip, etc as one string) 
- Excavator->CrewOnSite 

#### Notes Things we will be looking for to evaluate your skills: 
1. Code structure 
2. Code cleanliness 
3. Code diligence
4. Test cases Write the code and tests as you would in a production system - quality and diligence is important. 

Don't upload your solution to GitHub or any other publicly accessible website. 


#### Sample JSON 

```
                  "Suffix":"SW"
               },
               {
                  "State":"ZZ",
                  "County":"COUNTY",
                  "Place":"ATLANTA",
                  "Prefix":"",
                  "Name":"Jefferson",
                  "Type":"Ave",
                  "Suffix":"SW"
               }
            ]
         },
         "WellKnownText":"POLYGON((-81.13390268058475
32.07206917625161,-81.14660562247929
32.04064386441295,-81.08858407706913
32.02259853170128,-81.05322183341679
32.02434500961698,-81.05047525138554
32.042681017283066,-81.0319358226746
32.06537765335268,-81.01202310294804
32.078469305179404,-81.02850259513554
32.07963291684719,-81.07759774894413
32.07090546831167,-81.12154306144413
32.08806865844325,-81.13390268058475 32.07206917625161))"
      }
   }
}
```



#### Using the API

##### For create a new Ticket use this url and params:

Url: https://softensity-challeger.onrender.com/api/tickets/

Method: POST

Payload:
```
{
    "ticket": {
        "request_number": "09252012-00001",
        "sequence_number": "2421",
        "request_type": "Normal",
        "request_action": "Restake",
        "date_times": {
          "response_due_date_time": "2011/07/13 23:59:59"
        },
        "ticket_date_times": {
          "request_taken_date_time": "2011/07/02 23:09:38",
          "transmission_date_time": "",
          "legal_date_time": "2011/07/08 07:00:00",
          "response_due_date_time": "2011/07/13 23:59:59",
          "restake_date": "2011/07/21 00:00:00",
          "expiration_date": "2011/07/26 00:00:00",
          "lp_meeting_accept_due_date": "",
          "overhead_begin_date": "",
          "overhead_end_date": ""
        },
        "service_area": {
          "primary_service_area_code": {
            "sa_code": "ZZGL103"
          }
        },
        "additional_service_area_codes": {
          "sa_code": ["ZZL01", "ZZL02", "ZZL03"]
        },
        "digsite_info": {
          "well_known_text": "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))"
        }
      },
    "excavator": {
     "company_name": "John Doe CONSTRUCTION",
        "address": "555 Some RD",
        "crew_onsite": true,
        "city": "SOME PARK",
        "state": "ZZ",
        "zip": "55555",
        "type": "Excavator",
        "contact": {
            "name": "Johnny Doe",
            "phone": "1115552345",
            "email": "example@example.com"
         },
         "field_contact": {
            "name":  "Field Contact",
            "phone": "1235557924",
            "email": "example@example.com"
         }
    }
}

```

Output 
422: For invalid payloads \n
200: When created object


##### For list all tickets 

Url: Url: https://softensity-challeger.onrender.com/api/tickets

Method: GET

![Alt text](print-1.png?raw=true "Output Tickets")


#### For return info about especific ticket

Url: Url: https://softensity-challeger.onrender.com/api/tickets//1

Method: GET

![Alt text](print-2.png?raw=true "Output One Ticket ")
