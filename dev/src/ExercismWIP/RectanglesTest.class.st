"
# Rectangles

Count the rectangles in an ASCII diagram like the one below.

```text
   +--+
  ++  |
+-++--+
|  |  |
+--+--+
```

The above diagram contains 6 rectangles:

```text


+-----+
|     |
+-----+
```

```text
   +--+
   |  |
   |  |
   |  |
   +--+
```

```text
   +--+
   |  |
   +--+


```

```text


   +--+
   |  |
   +--+
```

```text


+--+
|  |
+--+
```

```text

  ++
  ++


```

You may assume that the input is always a proper rectangle (i.e. the length of
every line equals the length of the first line).

## Hint

TBD

"
Class {
	#name : #RectanglesTest,
	#superclass : #ExercismTest,
	#instVars : [
		'rectanglesCalculator'
	],
	#category : #'ExercismWIP-Rectangles'
}

{ #category : #config }
RectanglesTest class >> uuid [
	"Answer a unique id for this exercise"
	^'e5db72be-4a3f-0d00-bb4d-3e3a071d6982'
]

{ #category : #config }
RectanglesTest class >> version [
	"Generated from specification: 28 February 2019"
	^'1.1.0'
]

{ #category : #setup }
RectanglesTest >> setUp [
	rectanglesCalculator := Rectangles new
]

{ #category : #tests }
RectanglesTest >> test01_NoRows [
	| result |

	result := rectanglesCalculator rectanglesStrings: #() .
	self assert: result equals: 0
]

{ #category : #tests }
RectanglesTest >> test02_NoColumns [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('' ) .
	self assert: result equals: 0
]

{ #category : #tests }
RectanglesTest >> test03_NoRectangles [
	| result |

	result := rectanglesCalculator rectanglesStrings: #(' ' ) .
	self assert: result equals: 0
]

{ #category : #tests }
RectanglesTest >> test04_OneRectangle [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('+-+' '| |' '+-+' ) .
	self assert: result equals: 1
]

{ #category : #tests }
RectanglesTest >> test05_TwoRectanglesWithoutSharedParts [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('  +-+' '  | |' '+-+-+' '| |  ' '+-+  ' ) .
	self assert: result equals: 2
]

{ #category : #tests }
RectanglesTest >> test06_FiveRectanglesWithSharedParts [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('  +-+' '  | |' '+-+-+' '| | |' '+-+-+' ) .
	self assert: result equals: 5
]

{ #category : #tests }
RectanglesTest >> test07_RectangleOfHeight1IsCounted [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('+--+' '+--+' ) .
	self assert: result equals: 1
]

{ #category : #tests }
RectanglesTest >> test08_RectangleOfWidth1IsCounted [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('++' '||' '++' ) .
	self assert: result equals: 1
]

{ #category : #tests }
RectanglesTest >> test09_and1x1SquareIsCounted [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('++' '++' ) .
	self assert: result equals: 1
]

{ #category : #tests }
RectanglesTest >> test10_OnlyCompleteRectanglesAreCounted [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('  +-+' '    |' '+-+-+' '| | -' '+-+-+' ) .
	self assert: result equals: 1
]

{ #category : #tests }
RectanglesTest >> test11_RectanglesCanBeOfDifferentSizes [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('+------+----+' '|      |    |' '+---+--+    |' '|   |       |' '+---+-------+' ) .
	self assert: result equals: 3
]

{ #category : #tests }
RectanglesTest >> test12_CornerIsRequiredForARectangleToBeComplete [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('+------+----+' '|      |    |' '+------+    |' '|   |       |' '+---+-------+' ) .
	self assert: result equals: 2
]

{ #category : #tests }
RectanglesTest >> test13_LargeInputWithManyRectangles [
	| result |

	result := rectanglesCalculator rectanglesStrings: #('+---+--+----+' '|   +--+----+' '+---+--+    |' '|   +--+----+' '+---+--+--+-+' '+---+--+--+-+' '+------+  | |' '          +-+' ) .
	self assert: result equals: 60
]