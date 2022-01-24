module cv

pub struct Size {
	width  int
	height int
}

pub fn (m Mat) find_contours(mode RetrievalMode, method ContourApproximationMode) PointsVector {
	return find_contours(m, mode, method)
}

pub fn (m Mat) find_contours_with_params(hierarchy &Mat, mode RetrievalMode, method ContourApproximationMode) PointsVector {
	return find_contours_with_params(m, hierarchy, mode, method)
}

// pub fn (m Mat) gaussian_blur(mut dst Mat, ksize Size, sigma_x f64, sigma_y f64, borderType BorderType) {
// 	gaussian_blur(m, mut dst, ksize, sigma_x, sigma_y, borderType)
// }

// pub fn (m Mat) threshold(mut dst &Mat, thresh f64, maxvalue f64, typ ThresholdType) f64 {
// 	return threshold(m, mut dst, thresh, maxvalue, typ)
// }

// pub fn (m Mat) cvt_color(mut dst &Mat, code ColorConversionCode) {
// 	cvt_color(m, mut dst, code)
// }
