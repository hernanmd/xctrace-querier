Class {
	#name : #BaselineOfXCTraceQuerier,
	#superclass : #BaselineOf,
	#category : #BaselineOfXCTraceQuerier
}

{ #category : #baselines }
BaselineOfXCTraceQuerier >> baseline: spec [
  <baseline>
	spec
		for: #(common)
		do: [ 
			self baselineOfOSSubProcess: spec.
			self baselineOfXML: spec.
	
			spec 
				package: 'XCTraceQuerier';
				package: 'XCTraceQuerier-Tests'	with: [ spec requires: #(OSSubprocess XCTraceQuerier XPath) ].
			spec 
				group: 'Core' 						with: #('XCTraceQuerier');
				group: 'Tests' 						with: #('XCTraceQuerier' 'XCTraceQuerier-Tests');
				group: 'default' 					with: #('Core' 'Tests') ]
]

{ #category : #baselines }
BaselineOfXCTraceQuerier >> baselineOfOSSubProcess: spec [

	spec
		baseline: 'OSSubprocess'
		with: [ spec repository: 'github://marianopeck/OSSubprocess:master/repository' ]
]

{ #category : #baselines }
BaselineOfXCTraceQuerier >> baselineOfXML: spec [

	spec 
		baseline: 'XPath' 
		with: [
			spec
				repository: 'github://pharo-contributions/XML-XPath:3450f91/src';
				loads: #( Core ) ]
]
