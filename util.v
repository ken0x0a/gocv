module cv

pub fn imshow(img &Mat, name string) Window {
	mut win := new_window(name)
	win.imshow(img)
	win.set_window_property(.topmost, .autosize)
	return win
}
