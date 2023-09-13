Class {
	#name : #XCTraceAbstractObject,
	#superclass : #Object,
	#instVars : [
		'traceFilename'
	],
	#category : #XCTraceQuerier
}

{ #category : #accessing }
XCTraceAbstractObject >> buildCommand [
	
	self subclassResponsibility
]

{ #category : #accessing }
XCTraceAbstractObject >> execCmd: aShellCommand [
	"  "

	| command outputString |

	command := OSSUnixSubprocess new
		shellCommand: aShellCommand;
		redirectStdout;
		redirectStderr; 
	   runAndWaitOnExitDo: [ :process :outString :errString  |
        errString 
			ifNotEmpty: [ 
				outputString := 'Error'.
				errString inspect ]
			ifEmpty: [ outputString := outString ] ].
	command closeAndCleanStreams.
	^ outputString trimBoth
]

{ #category : #accessing }
XCTraceAbstractObject >> execXCTrace [

	^ self execCmd: self buildCommand
]

{ #category : #accessing }
XCTraceAbstractObject >> traceFilename [

	^ traceFilename
]

{ #category : #accessing }
XCTraceAbstractObject >> traceFilename: anObject [

	traceFilename := anObject
]
