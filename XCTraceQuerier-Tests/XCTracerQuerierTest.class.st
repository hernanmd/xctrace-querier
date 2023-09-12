Class {
	#name : #XCTracerQuerierTest,
	#superclass : #TestCase,
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
		traceFileReference: '';
		xmlFilename: 'output.xml';
		yourself.

]

{ #category : #running }
XCTracerQuerierTest >> testBuildCommand [


	self 
		assert: self querier buildCommand
		equals: ''
]
