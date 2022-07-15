Class PYTHONLEARNPKG.fakerData Extends %Persistent
{

Property Candidate As %String;

Property Postcode As %String;

Property Latitude As %String;

Property Longitude As %String;

Property Aqi As %String;

Property DayTime As %String;

ClassMethod GetFakeData(MsgNum As %Integer) As %String [ Language = python ]
{
    #import the iris module and show the classes in this namespace
    import iris
    import datetime
    from faker import Faker
    from faker.providers import barcode
    from faker.providers import address
    from faker.providers import geo
    from faker.providers import python

    
    for i in range(MsgNum):
        dayTime = datetime.datetime.now()
        fake = Faker()

        fake.add_provider(barcode)
        fake.add_provider(address)
        fake.add_provider(geo)
        fake.add_provider(python)

        can = fake.ean8()
        post = fake.postcode()
        lat = fake.latitude()
        long = fake.longitude()
        aq = fake.pyint()
    
        setData = iris.cls("PYTHONLEARNPKG.fakerData")._New()
        setData.Candidate = str(can)
        setData.Postcode = str(post)
        setData.Latitude = str(lat)
        setData.Longitude = str(long)
        setData.Aqi = str(aq)
        setData.DayTime = str(dayTime)
        setData._Save()
}

Storage Default
{
<Data name="fakerDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Candidate</Value>
</Value>
<Value name="3">
<Value>Postcode</Value>
</Value>
<Value name="4">
<Value>Latitude</Value>
</Value>
<Value name="5">
<Value>Longitude</Value>
</Value>
<Value name="6">
<Value>Aqi</Value>
</Value>
<Value name="7">
<Value>DayTime</Value>
</Value>
</Data>
<DataLocation>^PYTHONLEARNPKG.fakerDataD</DataLocation>
<DefaultData>fakerDataDefaultData</DefaultData>
<IdLocation>^PYTHONLEARNPKG.fakerDataD</IdLocation>
<IndexLocation>^PYTHONLEARNPKG.fakerDataI</IndexLocation>
<StreamLocation>^PYTHONLEARNPKG.fakerDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
