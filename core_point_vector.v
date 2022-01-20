module cv

fn C.PointVector_New() &C.PointVectors
// fn C.PointVector_NewFromPoints(cpoints)
fn C.PointVector_NewFromMat(&C.Mat) &C.PointVector
fn C.PointVector_Size(&C.PointVector) int
fn C.PointVector_At(&C.PointVector, int) C.Point
fn C.PointVector_Append(&C.PointVector, C.Point)
fn C.PointVector_Close(&C.PointVector)

[typedef]
struct C.PointVector {
}
[typedef]
struct C.Point {
	x int
	y int
}

pub struct ImagePoint {
	x int
	y int
}

// PointVector is a wrapper around a std::vector< cv::Point >*
// This is needed anytime that you need to pass or receive a collection of points.
pub struct PointVector {
mut:
	p &C.PointVector
}

// NewPointVector returns a new empty PointVector.
fn new_point_vector() PointVector {
	return PointVector{p: C.PointVector_New()}
}

// NewPointVectorFromPoints returns a new PointVector that has been
// initialized to a slice of ImagePoint.
// fn new_point_vector_from_points(pts []ImagePoint) PointVector {
// 	p := (*C.struct_Point)(C.malloc(C.size_t(C.sizeof_struct_Point * len(pts))))
// 	defer C.free(unsafe.Pointer(p))

// 	h := &reflect.SliceHeader{
// 		Data: uintptr(unsafe.Pointer(p)),
// 		Len:  len(pts),
// 		Cap:  len(pts),
// 	}
// 	pa := *(*[]C.Point)(unsafe.Pointer(h))

// 	for j, point := range pts {
// 		pa[j] = C.struct_Point{
// 			x: point.X
// 			y: point.Y
// 		}
// 	}

// 	cpoints := C.struct_Points{
// 		points: (*C.Point)(p)
// 		length: len(pts)
// 	}

// 	return PointVector{p: C.PointVector_NewFromPoints(cpoints)}
// }

// NewPointVectorFromMat returns a new PointVector that has been
// wrapped around a Mat of type CV_32SC2 with a single columm.
fn new_point_vector_from_mat(mat Mat) PointVector {
	return PointVector{p: C.PointVector_NewFromMat(mat.p)}
}

// IsNil checks the CGo pointer in the PointVector.
fn (pv &PointVector) isnil() bool {
	return isnil(pv.p)
}

// Size returns how many Point are in the PointVector.
fn (pv &PointVector) size() int {
	return C.PointVector_Size(pv.p)
}

// At returns the ImagePoint
fn (pv &PointVector) at(idx int) ImagePoint {
	if idx > pv.size() {
		return ImagePoint{}
	}

	cp := C.PointVector_At(pv.p, idx)
	return ImagePoint{x: cp.x, y: cp.y}
}

// Append appends an ImagePoint at end of the PointVector.
fn (pv &PointVector) append(point ImagePoint) {
	p := C.Point {
		x: point.x
		y: point.y
	}

	C.PointVector_Append(pv.p, p)
}

// ToPoints returns a slice of ImagePoint for the data in this PointVector.
fn (pv &PointVector) to_points() []ImagePoint {
	mut points := []ImagePoint{ cap: pv.size() }

	for j := 0; j < pv.size(); j++ {
		points[j] = pv.at(j)
	}
	return points
}

// Close closes and frees memory for this PointVector.
fn (pv &PointVector) close() {
	C.PointVector_Close(pv.p)
}
