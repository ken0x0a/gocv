module cv

// #flag -I.
// #flag -L.
// #flag -lvcv
// #include "core.h"
#flag -I@VMODROOT
#flag -L@VMODROOT -lvcv
#include "@VMODROOT/core.h"

fn C.Mat_New() &C.Mat
fn C.Mat_NewWithSize(height int, rows int, colors int) &C.Mat
fn C.Mat_DataPtr(&C.Mat) []byte
fn C.Mat_Rows(&C.Mat) int
fn C.Mat_Cols(&C.Mat) int
fn C.Mat_Channels(&C.Mat) int
fn C.Mat_Type(&C.Mat) int
fn C.Mat_Step(&C.Mat) int



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

// NewMatWithSize returns a new Mat with a specific size and type.
pub fn new_mat_with_size(rows int, cols int, mt MatType) Mat {
	return new_mat_from_c(C.Mat_NewWithSize(rows, cols, int(mt)))
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
pub fn (m &Mat) typ() MatType {
	return MatType(C.Mat_Type(m.p))
}

// Step returns the number of bytes each matrix row occupies.
pub fn (m &Mat) step() int {
	return C.Mat_Step(m.p)
}

// Wrapper for an individual cv::cvSize
[typedef]
pub struct C.Size {
	width  int
	height int
}

// MatType is the type for the various different kinds of Mat you can create.
pub enum MatType {
	// MatTypeCV8U is a Mat of 8-bit unsigned int
	cv8_u = 0
	// MatTypeCV8S is a Mat of 8-bit signed int
	cv8_s = 1
	// MatTypeCV16U is a Mat of 16-bit unsigned int
	cv16_u = 2
	// MatTypeCV16S is a Mat of 16-bit signed int
	cv16_s = 3
	// // MatTypeCV16SC2 is a Mat of 16-bit signed int with 2 channels
	// cv16_sc2 = MatTypeCV16S + MatChannels2
	// MatTypeCV32S is a Mat of 32-bit signed int
	cv32_s = 4
	// MatTypeCV32F is a Mat of 32-bit float
	cv32_f = 5
	// MatTypeCV64F is a Mat of 64-bit float
	cv64_f = 6
	// // MatTypeCV8UC1 is a Mat of 8-bit unsigned int with a single channel
	// cv8_uc1 = MatTypeCV8U + MatChannels1
	// // MatTypeCV8UC2 is a Mat of 8-bit unsigned int with 2 channels
	// cv8_uc2 = MatTypeCV8U + MatChannels2
	// // MatTypeCV8UC3 is a Mat of 8-bit unsigned int with 3 channels
	// cv8_uc3 = MatTypeCV8U + MatChannels3
	// // MatTypeCV8UC4 is a Mat of 8-bit unsigned int with 4 channels
	// cv8_uc4 = MatTypeCV8U + MatChannels4
	// // MatTypeCV8SC1 is a Mat of 8-bit signed int with a single channel
	// cv8_sc1 = MatTypeCV8S + MatChannels1
	// // MatTypeCV8SC2 is a Mat of 8-bit signed int with 2 channels
	// cv8_sc2 = MatTypeCV8S + MatChannels2
	// // MatTypeCV8SC3 is a Mat of 8-bit signed int with 3 channels
	// cv8_sc3 = MatTypeCV8S + MatChannels3
	// // MatTypeCV8SC4 is a Mat of 8-bit signed int with 4 channels
	// cv8_sc4 = MatTypeCV8S + MatChannels4
	// // MatTypeCV16UC1 is a Mat of 16-bit unsigned int with a single channel
	// cv16_uc1 = MatTypeCV16U + MatChannels1
	// // MatTypeCV16UC2 is a Mat of 16-bit unsigned int with 2 channels
	// cv16_uc2 = MatTypeCV16U + MatChannels2
	// // MatTypeCV16UC3 is a Mat of 16-bit unsigned int with 3 channels
	// cv16_uc3 = MatTypeCV16U + MatChannels3
	// // MatTypeCV16UC4 is a Mat of 16-bit unsigned int with 4 channels
	// cv16_uc4 = MatTypeCV16U + MatChannels4
	// // MatTypeCV16SC1 is a Mat of 16-bit signed int with a single channel
	// cv16_sc1 = MatTypeCV16S + MatChannels1
	// // MatTypeCV16SC3 is a Mat of 16-bit signed int with 3 channels
	// cv16_sc3 = MatTypeCV16S + MatChannels3
	// // MatTypeCV16SC4 is a Mat of 16-bit signed int with 4 channels
	// cv16_sc4 = MatTypeCV16S + MatChannels4
	// // MatTypeCV32SC1 is a Mat of 32-bit signed int with a single channel
	// cv32_sc1 = MatTypeCV32S + MatChannels1
	// // MatTypeCV32SC2 is a Mat of 32-bit signed int with 2 channels
	// cv32_sc2 = MatTypeCV32S + MatChannels2
	// // MatTypeCV32SC3 is a Mat of 32-bit signed int with 3 channels
	// cv32_sc3 = MatTypeCV32S + MatChannels3
	// // MatTypeCV32SC4 is a Mat of 32-bit signed int with 4 channels
	// cv32_sc4 = MatTypeCV32S + MatChannels4
	// // MatTypeCV32FC1 is a Mat of 32-bit float int with a single channel
	// cv32_fc1 = MatTypeCV32F + MatChannels1
	// // MatTypeCV32FC2 is a Mat of 32-bit float int with 2 channels
	// cv32_fc2 = MatTypeCV32F + MatChannels2
	// // MatTypeCV32FC3 is a Mat of 32-bit float int with 3 channels
	// cv32_fc3 = MatTypeCV32F + MatChannels3
	// // MatTypeCV32FC4 is a Mat of 32-bit float int with 4 channels
	// cv32_fc4 = MatTypeCV32F + MatChannels4
	// // MatTypeCV64FC1 is a Mat of 64-bit float int with a single channel
	// cv64_fc1 = MatTypeCV64F + MatChannels1
	// // MatTypeCV64FC2 is a Mat of 64-bit float int with 2 channels
	// cv64_fc2 = MatTypeCV64F + MatChannels2
	// // MatTypeCV64FC3 is a Mat of 64-bit float int with 3 channels
	// cv64_fc3 = MatTypeCV64F + MatChannels3
	// // MatTypeCV64FC4 is a Mat of 64-bit float int with 4 channels
	// cv64_fc4 = MatTypeCV64F + MatChannels4
}
