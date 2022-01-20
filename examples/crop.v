import cv

fn main() {
	img_name := 'images/fisheye_sample.jpg'
	mut img := cv.imread(img_name, .color)
	width := img.cols()
	height := img.rows()
	dump(width)
	dump(height)
	dump(width / 4)
	dump(height / 4)
	dump(width / 2)
	dump(height / 2)
	
	cropped_img := img.crop(height / 4, height * 3 / 4, width / 4, width * 3 / 4)
	win := cv.imshow(cropped_img, 'cropped_img')
	win.wait_key(0)
	println('done!')
	cv.imwrite('images/fisheye_sample_cropped.jpg', cropped_img)
}