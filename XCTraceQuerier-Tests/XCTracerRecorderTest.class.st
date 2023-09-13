Class {
	#name : #XCTracerRecorderTest,
	#superclass : #XCTracerTest,
	#instVars : [
		'recorder'
	],
	#category : #'XCTraceQuerier-Tests'
}

{ #category : #accessing }
XCTracerRecorderTest >> recorder [

	^ recorder
]

{ #category : #accessing }
XCTracerRecorderTest >> recorder: anObject [

	recorder := anObject
]

{ #category : #running }
XCTracerRecorderTest >> setUp [

	super setUp.
	self recorder: (XCTraceRecorder new
		imageFilename: (self imageLocation basenameWithIndicator , 'Pharo.image');
		pharoAppFilename: (self imageLocation basenameWithIndicator , 'pharo-vm/Pharo.app');
		templateName: 'Time Profiler';
		evalExpression: '''5000 factorial''';
		yourself)
]

{ #category : #tests }
XCTracerRecorderTest >> shutDown [

	(FileSystem workingDirectory childrenMatching: 'Launch*trace') 
		do: [ : location | location ensureDeleteAll ].
	super shutDown
]

{ #category : #tests }
XCTracerRecorderTest >> testBuildCommand [


	self 
		assert: self recorder buildCommand
		equals: 'xctrace record --template ''Time Profiler'' --target-stdout - --launch --  pharo-test-image/pharo-vm/Pharo.app --logLevel=4 --headless pharo-test-image/Pharo.image --no-default-preferences eval ''5000 factorial'''
]

{ #category : #tests }
XCTracerRecorderTest >> testExecXCTrace [

	| executionOutput |
	executionOutput := self recorder execXCTrace.
	self assert: (executionOutput beginsWith: 'Starting recording').
	self assert: (executionOutput endsWith: '.trace')

]
