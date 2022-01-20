module cv

fn C.PointsVector_New() &C.PointsVector
fn C.PointsVector_Close(&C.PointsVector)
fn C.PointsVector_Size(&C.PointsVector) int
fn C.PointsVector_At(&C.PointsVector, int) &C.PointVector
fn C.PointsVector_Append(&C.PointsVector, &C.PointVector) &C.PointVector

[typedef]
struct C.PointsVector {
}

// PointsVector is a wrapper around a std::vector< std::vector< cv::Point > >*
pub struct PointsVector {
	p &C.PointsVector
}

// NewPointsVector returns a new empty PointsVector.
pub fn new_points_vector() PointsVector {
	return PointsVector{
		p: C.PointsVector_New()
	}
}
// ToPoints returns a slice of slices of image.Point for the data in this PointsVector.
pub fn (pvs PointsVector) to_points() [][]ImagePoint {
	$if dev_cv_vector ? {
		dump(pvs.size())
	}
	mut ppoints := [][]ImagePoint{cap: pvs.size()}
	for i in 0 .. pvs.size() {
		pts := pvs.at(i)
		$if dev_cv_vector ? {
			dump(pts.size())
		}
		mut points := []ImagePoint{cap: pts.size()}

		for j in 0..pts.size() {
			points << pts.at(j)
		}
		ppoints << points
	}

	return ppoints
}
// IsNil checks the CGo pointer in the PointsVector.
pub fn (pvs PointsVector) isnil() bool {
	return isnil(pvs.p)
}

// Size returns how many vectors of Points are in the PointsVector.
pub fn (pvs PointsVector) size() int {
	return C.PointsVector_Size(pvs.p)
}

// At returns the PointVector at that index of the PointsVector.
pub fn (pvs PointsVector) at(idx int) PointVector {
	if idx > pvs.size() {
		return PointVector{p: C.PointVector_New()}
	}

	return PointVector{p: C.PointsVector_At(pvs.p, idx)}
}

// Append appends a PointVector at end of the PointsVector.
pub fn (pvs PointsVector) append(pv PointVector) {
	if !pv.isnil() {
		C.PointsVector_Append(pvs.p, pv.p)
	}

	return
}

// Close closes and frees memory for this PointsVector.
pub fn (pvs PointsVector) close() {
	C.PointsVector_Close(pvs.p)
}
