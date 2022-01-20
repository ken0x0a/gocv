module cv

fn C.Mat_Close(&C.Mat)

// newMat returns a new Mat from a C Mat
fn new_mat_from_c(p &C.Mat) Mat {
	return Mat{
		p: p
	}
}

// Close the Mat object.
pub fn (mut m Mat) close() {
	C.Mat_Close(m.p)
	m.p = voidptr(0)
	m.d.clear()
}

pub fn (mut m Mat) free() {
	m.close()
}
