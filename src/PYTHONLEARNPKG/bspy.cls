Class PYTHONLEARNPKG.bspy Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %RegisteredObject, pOutput As %RegisteredObject) As %Status [ Language = python ]
{
   
        import iris
        import dateTime
        tSubject = pInput.StringValue
        daytime = datetime.daytime.now()   
        tApplication = iris.cls('Demo.timeMsg')._New()
        tApplication.dayTime = daytime
        return self.SendRequestAsync("Demo.timeMsg",tApplication )
}

}
