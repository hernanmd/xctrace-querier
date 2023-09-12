Class {
	#name : #XCTraceAbstractObject,
	#superclass : #Object,
	#category : #XCTraceQuerier
}

{ #category : #accessing }
XCTraceAbstractObject >> buildCommand [
	
	self subclassResponsibility
]

{ #category : #accessing }
XCTraceAbstractObject >> execXCTrace [

	| command outputString |

	command := OSSUnixSubprocess new
		shellCommand: self buildCommand;
		redirectStdout;
		redirectStderr;
	 	runAndWaitOnExitDo: [ :process :outString :errString  |
			errString 
				ifNotEmpty: [ 
					outputString := 'Error'.
					errString inspect ]
				ifEmpty: [ outputString := outString ] ].
	command closeAndCleanStreams.
	^ outputString
]
