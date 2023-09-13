Class {
	#name : #XCTracerQuerierTest,
	#superclass : #XCTracerTest,
	#instVars : [
		'querier'
	],
	#category : #'XCTraceQuerier-Tests'
}

{ #category : #accessing }
XCTracerQuerierTest >> querier [

	^ querier
]

{ #category : #accessing }
XCTracerQuerierTest >> querier: anObject [

	querier := anObject
]

{ #category : #running }
XCTracerQuerierTest >> setUp [

	super setUp.
	querier := XCTraceQuerier new
		imageFilename: self imageLocation basenameWithIndicator , 'Pharo.image';
		pharoAppFilename: self imageLocation basenameWithIndicator , 'Pharo.app';	
		templateName: 'Time Profiler';
		evalExpression: '5000 factorial';
		xmlFilename: 'output.xml';
		yourself.

]

{ #category : #running }
XCTracerQuerierTest >> testBuildCommand [


	self 
		assert: self querier buildCommand
		equals: 'xctrace record --template ''Time Profiler'' --target-stdout - --launch --  pharo-test-image/Pharo.app --logLevel=4 --headless pharo-test-image/Pharo.image --no-default-preferences eval 5000 factorial'
]
