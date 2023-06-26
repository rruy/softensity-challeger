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
 "AddressNum":[

 "Address 1",

 "Address 2"

 ]

 },

 "Street":{

 "Prefix":"",

 "Name":"Trinity",

 "Type":"Ave",

 "Suffix":"SW"

 }

 },

 "NearStreet":{

 "State":"XX",

 "County":"SomeCounty",

 "Place":"City",

 "Prefix":"",

 "Name":"",

 "Type":"",

 "Suffix":""

 },

 "Intersection":{

 "ItoI":[

 {

 "State":"XX",

 "County":"FULERTON",

 "Place":"NORCROSS",

 "Prefix":"",

 "Name":"London",

 "Type":"St",

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

 "WellKnownText":"POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))"

 }

 }

}
```
>>>>>>> 11bc634dc773576e7288dbd751c0498b07d1db03
