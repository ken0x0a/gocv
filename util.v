module cv

pub fn imshow(img &Mat, name string) Window {
	mut win := new_window(name)
	win.imshow(img)
	win.set_window_property(.topmost, .autosize)
	return win
}


pub fn (m &Mat) resize(sz ImagePoint, fx f64, fy f64, interp InterpolationFlags) Mat {
	mut dst := new_mat()
	resize(m, mut dst, sz, fx, fy, interp)
	return dst
}
pub fn (m &Mat) cvt_color(code ColorConversionCode) Mat {
	mut dst := new_mat()
	cvt_color(m, mut dst, code)
	return dst
}
pub fn (m &Mat) threshold(thresh f64, maxvalue f64, typ ThresholdType) (Mat, f64) {
	mut dst := new_mat()
	th := threshold(m, mut dst, thresh, maxvalue, typ)
	return dst, th
}
pub fn (m &Mat) gaussian_blur(ksize Size, sigma_x f64, sigma_y f64, borderType BorderType) Mat {
	mut dst := new_mat()
	gaussian_blur(m, mut dst, ksize, sigma_x, sigma_y, borderType)
	return dst
}
pub fn (m &Mat) canny(t1 f64, t2 f64) Mat {
	mut dst := new_mat()
	canny(m, mut dst, t1, t2)
	return dst
}
pub fn (m &Mat) dilate(kernel Mat, opts DilateOpts) Mat {
	mut dst := new_mat()
	dilate_with_params(m, mut dst, kernel, opts)
	return dst
}