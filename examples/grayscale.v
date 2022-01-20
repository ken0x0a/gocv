import cv
import os

const (
	high_thresh = 400
	low_thresh = 20
	blur_size = 11
)
fn main() {
	// mut img := cv.imread('./images/toy.jpg', .color)
	img_name := os.args[1]
	mut img_orig := cv.imread(img_name, .color)
	mut img := cv.new_mat()
	mut img_gray := cv.new_mat()
	mut img_thresh := cv.new_mat()
	mut img_blur := cv.new_mat()
	mut img_canny := cv.new_mat()
	mut img_dilate := cv.new_mat()

	// cleaning up image
	cv.cvt_color(img_orig, mut &img_gray, .bgr_to_gray)
	println('cvt_color')
	cv.threshold(img_gray, mut &img_thresh, 0, 255, cv.ThresholdType(int(cv.ThresholdType.binary_inv) + int(cv.ThresholdType.otsu)))
	println('threshold')
	cv.gaussian_blur(img_thresh, mut &img_blur, cv.Size{width: blur_size, height: blur_size}, 0, 0, .reflect101)
	println('gaussian_blur')
	cv.canny(img_blur, mut img_canny, low_thresh, high_thresh)
	println('canny')
	cv.dilate_with_params(img_canny, mut &img_dilate, cv.new_mat_with_size(3, 3, .cv8_u), iterations: 2)
	println('dilate_with_params')
	cv.imshow(img_gray, 'gray')
	// cv.imshow(img, 'img')
	cv.imshow(img_dilate, 'img_dilate')


	// // then dilate
	// mut kernel := cv.get_structuring_element(.rect, cv.Size{3, 3})
	// defer { kernel.close() }
	// cv.dilate(img, mut &img, kernel)

	// points := cv.find_contours(img, .external, .chain_approx_none)
	// defer { points.close() }
	// points.to_points()
	// // dump(points.to_points())

	mut win := cv.new_window('Hello')
	defer {
		img.close()
		img_gray.close()
		img_thresh.close()
		win.close()
	}
	// dump(mt)
	// dump(mt.rows())
	// dump(mt.cols())
	// dump(mt.channels())
	// dump(mt.step())
	// for {
	// win.imshow(img)
	win.set_window_property(.topmost, .autosize)
	win.wait_key(0)
}
// fn main() {
// 	mut img := cv.imread('./images/toy.jpg', .color)
// 	mut img_grey := cv.new_mat()
// 	mut img_blur := cv.new_mat()
// 	mut img_canny := cv.new_mat()
// 	mut img_thresh := cv.new_mat()

// 	// cleaning up image
// 	cv.cvt_color(img, mut &img_grey, .bgrto_gray)
// 	cv.gaussian_blur(img_grey, mut &img_blur, cv.Size{width: blur_size, height: blur_size}, 0, 0, .reflect101)
//   cv.canny(img_blur, mut img_canny, low_thresh, high_thresh)
//   // cv.dilate(iterations)

// 	// cv.threshold(img_blur, mut &img_thresh, 0, 255, cv.ThresholdType(int(cv.ThresholdType.binary_inv) + int(cv.ThresholdType.otsu)))

// 	// then dilate
// 	mut kernel := cv.get_structuring_element(.rect, cv.Size{3, 3})
// 	defer { kernel.close() }
// 	cv.dilate(img_canny, mut &img_canny, kernel)


// 	mut win := cv.new_window('Hello')
// 	defer {
// 		img.close()
// 		img_grey.close()
// 		img_blur.close()
// 		img_thresh.close()
// 		img_canny.close()
// 		win.close()
// 	}
// 	// dump(mt)
// 	// dump(mt.rows())
// 	// dump(mt.cols())
// 	// dump(mt.channels())
// 	// dump(mt.step())
// 	// for {
// 	win.imshow(img_canny)
// 	win.set_window_property(.topmost, .autosize)
// 	if win.wait_key(0) >= 0 {
// 		// break
// 	}
// }
