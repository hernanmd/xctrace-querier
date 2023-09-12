Class {
	#name : #XCTraceAbstractObject,
	#superclass : #Object,
	#category : #XCTraceQuerier
}

{ #category : #accessing }
XCTraceAbstractObject >> execXCTrace [

	| command |

	command := OSSUnixSubprocess new
		shellCommand: self buildCommand;
		redirectStdout;
		redirectStderr;
	 	runAndWaitOnExitDo: [ :process :outString :errString  |
			"errString inspect.
			outString inspect"  ].
	command closeAndCleanStreams.
]
