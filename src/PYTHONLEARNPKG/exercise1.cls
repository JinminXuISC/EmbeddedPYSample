Class PYTHONLEARNPKG.exercise1
{

/// Description
ClassMethod pyHello() As %Status
{
        set pythonBuiltins = ##class(%SYS.Python).Builtins()
        do pythonBuiltins.print("HelloWorld!")
}

/// Description
ClassMethod pyForLoop() [ Language = python ]
{
   for i in range(5):
    print("Python")
}

}
