Class {
	#name : #XCTraceExporter,
	#superclass : #XCTraceRecorder,
	#instVars : [
		'xmlFilename'
	],
	#category : #XCTraceQuerier
}

{ #category : #accessing }
XCTraceExporter >> buildExportCommand [

	^ String streamContents: [ : stream |
		stream 
			<< 'xctrace export --input ';
			<< self traceFilename;
			<< ' --output ';
			<< self xmlFilename ]

]

{ #category : #accessing }
XCTraceExporter >> defaultXmlFilename [
	" Use the name from the .trace filename "
	
	| traceFileRef |
	
	traceFileRef := self traceFilename asFileReference.
	^ String streamContents: [ : stream |
		stream 
			<< traceFileRef withoutExtension basename;
			<< '.xml' ]
]

{ #category : #accessing }
XCTraceExporter >> execXCTrace [
	" Answer the output .trace file name"

	| rawOutput outputReportTraceString |
	
	rawOutput := super execXCTrace.
	outputReportTraceString := rawOutput lines 
		detect: [ : line | line beginsWith: 'Output file saved as' ] 
		ifNone: [ self error: 'Trace file not generated' ].
	self traceFilename: (outputReportTraceString findTokens: ' ') last.
	^ self traceFilename
]

{ #category : #accessing }
XCTraceExporter >> xmlFilename [

	^ xmlFilename
		ifNil: [ xmlFilename := self defaultXmlFilename ]
]

{ #category : #accessing }
XCTraceExporter >> xmlFilename: anObject [

	xmlFilename := anObject
]
