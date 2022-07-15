/// Description
Class PYTHONLEARNINGPKG.toIris Extends %Persistent
{

Property dayTime As %String;

ClassMethod GetData() As %Status [ Language = python ]
{
   import iris
   import datetime
   while True:
    timeNow = datetime.datetime.now()
    print(timeNow)
    setTime = iris.cls("PYTHONLEARNINGPKG.toIris")._New()
    setTime.dayTime = str(timeNow)
    setTime._Save()
}

/// Description
ClassMethod GetDataOS() As %Status
{
    
   set dt = ##class(PYTHONLEARNINGPKG.toIris).%New()
   set dt.dayTime = "1900"
   do dt.%Save()
}

Storage Default
{
<Data name="toIrisDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>dayTime</Value>
</Value>
</Data>
<DataLocation>^PYTHONLEARNINGPKG.toIrisD</DataLocation>
<DefaultData>toIrisDefaultData</DefaultData>
<IdLocation>^PYTHONLEARNINGPKG.toIrisD</IdLocation>
<IndexLocation>^PYTHONLEARNINGPKG.toIrisI</IndexLocation>
<StreamLocation>^PYTHONLEARNINGPKG.toIrisS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
