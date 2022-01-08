module cv

#flag -I.
#flag -L.
#flag -lvcv
#include "core.h"


fn C.Mat_New() &C.Mat
fn C.Mat_DataPtr(&C.Mat) []byte
fn C.Mat_Rows(&C.Mat) int
fn C.Mat_Cols(&C.Mat) int
fn C.Mat_Channels(&C.Mat) int
fn C.Mat_Type(&C.Mat) int
fn C.Mat_Step(&C.Mat) int
fn C.PointsVector_New() &C.PointsVector

[typedef]
struct C.PointsVector {

}

// PointsVector is a wrapper around a std::vector< std::vector< cv::Point > >*
pub struct PointsVector {
	p &C.PointsVector
}

// NewPointsVector returns a new empty PointsVector.
pub fn new_points_vector() PointsVector {
	return PointsVector{p: C.PointsVector_New()}
}

[heap; typedef]
struct C.Mat {}

[typedef]
struct C.ByteArray {}

pub struct Mat {
mut:
	p &C.Mat
	// Non-nil if Mat was created with a []byte (using NewMatFromBytes()). Nil otherwise.
	d []byte
}

// NewMat returns a new empty Mat.
pub fn new_mat() Mat {
	return new_mat_from_c(C.Mat_New())
}

// Rows returns the number of rows for this Mat.
pub fn (m &Mat) rows() int {
	return C.Mat_Rows(m.p)
}

// Cols returns the number of columns for this Mat.
pub fn (m &Mat) cols() int {
	return C.Mat_Cols(m.p)
}

// Channels returns the number of channels for this Mat.
pub fn (m &Mat) channels() int {
	return C.Mat_Channels(m.p)
}

// Type returns the type for this Mat.
// pub fn (m &Mat) type() MatType {
// 	return MatType(C.Mat_Type(m.p))
// }

// Step returns the number of bytes each matrix row occupies.
pub fn (m &Mat) step() int {
	return C.Mat_Step(m.p)
}
