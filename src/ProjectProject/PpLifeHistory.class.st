Class {
	#name : #PpLifeHistory,
	#superclass : #Object,
	#instVars : [
		'callLog',
		'addressBook'
	],
	#classInstVars : [
		'mine'
	],
	#category : #'ProjectProject-Core'
}

{ #category : #'as yet unclassified' }
PpLifeHistory class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Life History Inspect')
		order: 0.5;
		action: [ self mine inspect ];
		icon: (Smalltalk ui icons iconNamed: #toolsIcon). 
]

{ #category : #'as yet unclassified' }
PpLifeHistory class >> mine [
	^ mine ifNil: [ mine := self new ]
]

{ #category : #persistence }
PpLifeHistory class >> restoreFrom: anObject [

	mine := anObject.
]

{ #category : #persistence }
PpLifeHistory class >> spData [
	^ self mine
]

{ #category : #accessing }
PpLifeHistory >> addressBook [
	^ self maLazyInstVarUsing: self addressBookDescription
]

{ #category : #accessing }
PpLifeHistory >> addressBook: anObject [
	addressBook := anObject
]

{ #category : #accessing }
PpLifeHistory >> addressBookDescription [
	<magritteDescription>
	
	^ MAToOneRelationDescription new
			accessor: #addressBook;
			priority: 200;
			default: MpAddressBook default;
			classes: { MpAddressBook };
			yourself
]

{ #category : #'as yet unclassified' }
PpLifeHistory >> callLog [
	^ callLog ifNil: [ callLog := Bag new ]
]

{ #category : #'as yet unclassified' }
PpLifeHistory >> callLogDescription [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
			accessor: #callLog;
			label: 'Call Log';
			priority: 100;
			default: Bag new;
			classes: { PpPhoneCall };
			yourself
]
