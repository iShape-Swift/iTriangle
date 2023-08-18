# iTriangle
Complex polygon triangulation, tessellation, and splitting into convex polygons. Initially, for the first triangulation, it uses monotone polygons' triangulation, and then it applies an iterative algorithm to create Delaunay triangulation. If your polygon has self-intersections or some degenerate cases, they will be resolved with [iOverlay] 
 [https://github.com/iShape-Swift/iOverlay]. iTriangle uses fixed-float math in the range -1,000,000.000 to 1,000,000.000 with a precision of 0.001, but the recommended range is -100,000 to 100,000 with precision.
 
## Delaunay triangulation
<p align="center">
<img src="https://github.com/iShape-Swift/iShapeTriangulation/blob/master/Readme/star_triangle.svg" width="500"/>
</p>

## Breaking into convex polygons
<p align="center">
<img src="https://github.com/iShape-Swift/iShapeTriangulation/blob/master/Readme/star_polygon.svg" width="500" />
</p>

## Tessellation
<p align="center">
<img src="https://github.com/iShape-Swift/iShapeTriangulation/blob/master/Readme/eagle_tessellation.svg" width="800" />
</p>

## Centroid net
<p align="center">
<img src="https://github.com/iShape-Swift/iShapeTriangulation/blob/master/Readme/eagle_centroid.svg" width="800" />
</p>

## Features

- Fast O(n*log(n)) algorithm based on "Triangulation of Monotone Polygons"

- All code is written in accordance with "Data-Oriented Design." No reference types like classes, just structs.

- Supports polygons with holes, self-intersections, and other degenerate cases

- Supports tessellation

- Supports breaking into convex polygons

- Supports building centroid nets

- Utilizes integer geometry for calculations

## Basic Usage

Add imports:
```swift
import iShape
import iFixFloat
import iTriangle
```

After that, represent your polygon as an array of vertices listed in a clockwise direction. Here's an example of a cheese polygon:
<p align="center">
<img src="https://github.com/iShape-Swift/iTriangleation/blob/master/Readme/cheese_example_0.svg" width="600"/>
</p>

```swift
let shape = FixShape(
    contour: [
        Vec(x:   0, y:  20).fix,     // 0
        Vec(x:   8, y:  10).fix,     // 1
        Vec(x:   7, y:   6).fix,     // 2
        Vec(x:   9, y:   1).fix,     // 3
        Vec(x:  13, y:  -1).fix,     // 4
        Vec(x:  17, y:   1).fix,     // 5
        Vec(x:  26, y:  -7).fix,     // 6
        Vec(x:  14, y: -15).fix,     // 7
        Vec(x:   0, y: -18).fix,     // 8
        Vec(x: -14, y: -15).fix,     // 9
        Vec(x: -25, y:  -7).fix,     // 10
        Vec(x: -18, y:   0).fix,     // 11
        Vec(x: -16, y:  -3).fix,     // 12
        Vec(x: -13, y:  -4).fix,     // 13
        Vec(x:  -8, y:  -2).fix,     // 14
        Vec(x:  -6, y:   2).fix,     // 15
        Vec(x:  -7, y:   6).fix,     // 16
        Vec(x: -10, y:   8).fix      // 17
    ], holes: [
        [
            Vec(x:   2, y:   0).fix, // 18
            Vec(x:  -2, y:  -2).fix, // 19
            Vec(x:  -4, y:  -5).fix, // 20
            Vec(x:  -2, y:  -9).fix, // 21
            Vec(x:   2, y: -11).fix, // 22
            Vec(x:   5, y:  -9).fix, // 23
            Vec(x:   7, y:  -5).fix, // 24
            Vec(x:   5, y:  -2).fix  // 25
        ]
    ])

let triangulation = shape.triangulate()

print("points: \(triangulation.points.map({ $0.float }))")
print("indices: \(triangulation.indices)")
```
While creating a shape, you can add any number of holes. The paths you add can be self-intersecting. Self-intersections will be removed during the triangulation process using the even-odd rule.
As a result, you will receive a "Triangulation" structure of int-points and indices; all triangles must be counted in a clockwise direction. Don't forget to convert it back to your preferred data type like float2, CGPoint, etc.


## Installation

### [Package Manager](https://swift.org/package-manager/)


Add the following to your `Package.swift`:
```swift
let package = Package(
    name: "[your name]",
    products: [
        dependencies: [
            .package(url: "https://github.com/iShape-Swift/iTriangle", from: "1.0.0")
        ],
        targets: [
            .target(
                name: "[your target]",
                dependencies: ["iTriangle"])
        ]
    ]
)
```
Or add it directly through .xcodeproj

<p align="center">
<img src="https://github.com/iShape-Swift/iTriangle/blob/master/Readme/SwiftPackageManager_tip.png" width="600"/>
</p>
