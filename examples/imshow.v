module main

import cv

fn main() {
	mat := cv.new_mat()
	dump(mat)
	dump(mat.rows())
	dump(mat.cols())
	dump(mat.channels())
	dump(mat.step())
	mut win := cv.new_window('Hello')
	defer { win.close() }
	mt := cv.imread('./images/toy.jpg', .color)
	dump(mt)
	dump(mt.rows())
	dump(mt.cols())
	dump(mt.channels())
	dump(mt.step())
	// for {
	win.imshow(mt)
	win.set_window_property(.topmost, .autosize)
	if win.wait_key(0) >= 0 {
		// break
	}
	// }
	// time.sleep(10 * time.second)
	dump(mt.step())
}

// fn (m &Mat) to_bytes() []byte {
// 	b := C.Mat_DataPtr(m.p)
// 	return to_go_bytes(b)
// }
// fn to_go_bytes(b C.ByteArray) []byte {
// 	return C.GoBytes(unsafe.Pointer(b.data), b.length)
// }

