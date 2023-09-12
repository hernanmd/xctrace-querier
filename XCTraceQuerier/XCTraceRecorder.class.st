Class {
	#name : #XCTraceRecorder,
	#superclass : #XCTraceAbstractObject,
	#instVars : [
		'templateName',
		'pharoAppFilename',
		'imageFilename'
	],
	#category : #XCTraceQuerier
}

{ #category : #export }
XCTraceRecorder class >> exampleRecord [

	^ self new
		templateName: 'Time Profiler';
		imageFilename: 'Launch_Pharo.app_2023-09-12_15.54.22_87E6E450.trace';
		pharoAppFilename: '... /Pharo.app';
		record
]

{ #category : #accessing }
XCTraceRecorder >> buildCommand [

	^ String streamContents: [ : stream |
		stream
			<< 'xctrace record --template ';
			<< self templateName;
			<< '--target-stdout - --launch --  ';
			<< self pharoAppFilename;
			<< ' --logLevel=4';
			<< self imageFilename ]
]

{ #category : #accessing }
XCTraceRecorder >> imageFilename [

	^ imageFilename
]

{ #category : #accessing }
XCTraceRecorder >> imageFilename: anObject [

	imageFilename := anObject
]

{ #category : #accessing }
XCTraceRecorder >> pharoAppFilename [

	^ pharoAppFilename
]

{ #category : #accessing }
XCTraceRecorder >> pharoAppFilename: anObject [

	pharoAppFilename := anObject
]

{ #category : #accessing }
XCTraceRecorder >> templateName [

	^ templateName
]

{ #category : #accessing }
XCTraceRecorder >> templateName: anObject [

	templateName := anObject
]
