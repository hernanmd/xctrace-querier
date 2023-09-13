Class {
	#name : #XCTraceQuerier,
	#superclass : #XCTraceExporter,
	#category : #XCTraceQuerier
}

{ #category : #export }
XCTraceQuerier class >> exampleExport [

	^ self new
		traceFilename: 'Launch_Pharo.app_2023-09-13_13.43.38_28DAFFF5.trace';
		xmlFilename: 'trace_times.xml';
		timeSamples

]

{ #category : #accessing }
XCTraceQuerier >> buildExportCommand [

	^ String streamContents: [ : stream |
		stream
			<< super buildExportCommand;
			<< ' --xpath ';
			<< self xPathTimeProfileQuery surroundedBySingleQuotes ]
]

{ #category : #accessing }
XCTraceQuerier >> execXCTrace [
	" Answer the output .trace file name"

	super execXCTrace.
	^ self execCmd: self buildExportCommand
]

{ #category : #accessing }
XCTraceQuerier >> parseXML [

	^ XMLDOMParser parse: self xmlFilename asFileReference.
]

{ #category : #accessing }
XCTraceQuerier >> timeSamples [
	"Answer a <Collection> of <XMLElement> representing the receiver's XML sample times"

	^ self parseXML xpath: '/trace-query-result/node/row'
]

{ #category : #accessing }
XCTraceQuerier >> xPathPharoPointOfInterest [

	^ '/trace-toc/run[@number="1"]/data/table[@schema="pharo-signpost"]'

]

{ #category : #accessing }
XCTraceQuerier >> xPathTimeProfileQuery [

	^ '/trace-toc/run[@number="1"]/data/table[@schema="time-profile"]'
]

{ #category : #accessing }
XCTraceQuerier >> xPathTimeSampleQuery [

	^ '/trace-toc/run[@number="1"]/data/table[@schema="time-sample"]'
]
