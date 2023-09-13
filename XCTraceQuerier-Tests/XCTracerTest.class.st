Class {
	#name : #XCTracerTest,
	#superclass : #TestCase,
	#instVars : [
		'imageLocation'
	],
	#category : #'XCTraceQuerier-Tests'
}

{ #category : #accessing }
XCTracerTest >> imageLocation [

	^ imageLocation
]

{ #category : #accessing }
XCTracerTest >> imageLocation: anObject [

	imageLocation := anObject
]

{ #category : #running }
XCTracerTest >> setUp [

	super setUp.
	self imageLocation: 'pharo-test-image' asFileReference.
]
