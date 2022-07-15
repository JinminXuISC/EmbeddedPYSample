Class PYTHONLEARNPKG.exercise2 Extends %Persistent
{

Property Time As %String;

Property Temperature As %String;

Property PM2d5 As %String;

/// Description
ClassMethod GetFakeData() As %Status [ Language = python ]
{
    import json
    import time
    import random
    topic = "sensors"
    sensors = {
        "Sensor 1": {
            "lat": 10,
            "lng": 10,
            "unit": "C",
            "type": "temperature",
            "range": [0, 45],
            "description": "Main Entrance"
        },
        "Sensor 2": {
            "lat": 90,
            "lng": 90,
            "unit": "C",
            "type": "temperature",
            "range": [0, 45],
            "description": "Kitchen"
        }
    }
    interval_ms = 3
    verbose = True

    keys = list(sensors.keys())
    interval_secs = interval_ms

    while True:
        sensor_id = random.choice(keys)
        sensor = sensors[sensor_id]
        min_val, max_val = sensor.get("range", [0, 100])
        val = random.randint(min_val, max_val)

        data = {
            "id": sensor_id,
            "value": val
        }

        for key in ["lat", "lng", "unit", "type", "description"]:
            value = sensor.get(key)

            if value is not None:
                data[key] = value

        payload = json.dumps(data)

        if verbose:
            print("%s: %s" % (topic, payload))

        time.sleep(interval_secs)
}

Storage Default
{
<Data name="exercise2DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Time</Value>
</Value>
<Value name="3">
<Value>Temperature</Value>
</Value>
<Value name="4">
<Value>PM2d5</Value>
</Value>
</Data>
<DataLocation>^PYTHONLEARNPKG.exercise2D</DataLocation>
<DefaultData>exercise2DefaultData</DefaultData>
<IdLocation>^PYTHONLEARNPKG.exercise2D</IdLocation>
<IndexLocation>^PYTHONLEARNPKG.exercise2I</IndexLocation>
<StreamLocation>^PYTHONLEARNPKG.exercise2S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
