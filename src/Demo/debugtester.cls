Class Demo.debugtester
{

ClassMethod GetData() As %Status
{
        set tRequest = ..PythonOnProcessInput()
        zw tRequest
        zw tRequest.dayTime
}

ClassMethod PythonOnProcessInput() As Demo.timeMsg [ Language = python ]
{
	import iris
	import datetime
	daytime = datetime.datetime.now()
	tRequest = iris.cls('Demo.timeMsg')._New()
	tRequest.dayTime = str(daytime)
	return tRequest
}

}
