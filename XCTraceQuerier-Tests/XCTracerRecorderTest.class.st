Class {
	#name : #XCTracerRecorderTest,
	#superclass : #TestCase,
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
		imageFilename: 'pharo-test-image/Pharo.image';
		pharoAppFilename: 'pharo-test-image/pharo-vm/Pharo.app';
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
		equals: 'xctrace record --template ''Time Profiler'' --target-stdout - --launch --  pharo-test-image/pharo-vm/Pharo.app --logLevel=4 -headless pharo-test-image/Pharo.image eval ''5000 factorial'''
]

{ #category : #tests }
XCTracerRecorderTest >> testExecXCTrace [


	self 
		assert: self recorder execXCTrace
		equals: ''
]
