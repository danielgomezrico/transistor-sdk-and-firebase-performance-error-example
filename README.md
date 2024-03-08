# spike_transistor_sdk

Run make prepare_env to configure firebase

IF you check firebase performances was able to catch the request
been done in the activity with okhttp:

```
03-08 01:23:25.951 11347 11463 W FirebasePerformance: Unable to process the PerfMetric (network request trace: http://myserver.com/gps/fake (responseCode: UNKNOWN, responseTime: 6031.912ms)) due to missing or invalid values. See earlier log statements for additional information on the specific missing/invalid values.
```

But all of the requests that runs automatically from the library
are not catched at all.