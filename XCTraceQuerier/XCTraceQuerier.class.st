Class {
	#name : #XCTraceQuerier,
	#superclass : #XCTraceAbstractObject,
	#instVars : [
		'traceFileReference',
		'inputTraceFilename',
		'xmlFilename'
	],
	#category : #XCTraceQuerier
}

{ #category : #export }
XCTraceQuerier class >> exampleExport [

	^ self new
		inputTraceFilename: 'Launch_Pharo.app_2023-09-12_15.54.22_87E6E450.trace';
		xmlFilename: 'trace_times.xml';
		timeSamples

]

{ #category : #accessing }
XCTraceQuerier >> buildCommand [

	^ String streamContents: [ : stream |
		stream
			<< 'xctrace export --input ';
			<< self traceFileReference fullName;
			<< ' --xpath ';
			<< self xPathTimeSampleQuery;
			<< ' --output';
			<< self xmlFilename ]
]

{ #category : #accessing }
XCTraceQuerier >> inputTraceFilename [

	^ inputTraceFilename
]

{ #category : #accessing }
XCTraceQuerier >> inputTraceFilename: anObject [

	inputTraceFilename := anObject
]

{ #category : #accessing }
XCTraceQuerier >> readXML [

	^ XMLDOMParser parse: self xmlFilename asFileReference.
]

{ #category : #accessing }
XCTraceQuerier >> timeSamples [
	"Answer a <Collection> of <XMLElement> representing the receiver's XML sample times"

	^ self readXML xpath: '/trace-query-result/node/row'
]

{ #category : #accessing }
XCTraceQuerier >> traceFileReference [

	^ traceFileReference
]

{ #category : #accessing }
XCTraceQuerier >> traceFileReference: anObject [

	traceFileReference := anObject
]

{ #category : #accessing }
XCTraceQuerier >> xPathPharoPointOfInterest [

	^ '/trace-toc/run[@number="1"]/data/table[@schema="pharo-signpost"]'

]

{ #category : #accessing }
XCTraceQuerier >> xPathTimeSampleQuery [

	^ '/trace-toc/run[@number="1"]/data/table[@schema="time-sample"]'
]

{ #category : #accessing }
XCTraceQuerier >> xmlFilename [

	^ xmlFilename
]

{ #category : #accessing }
XCTraceQuerier >> xmlFilename: anObject [

	xmlFilename := anObject
]
