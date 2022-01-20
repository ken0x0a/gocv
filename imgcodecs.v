module cv

#include "imgcodecs.h"

fn C.Image_IMRead(&char, int) &C.Mat
fn C.Image_IMWrite(&char, &C.Mat) bool

// IMReadFlag is one of the valid flags to use for the IMRead function.
pub enum IMReadFlag {
	// IMReadUnchanged return the loaded image as is (with alpha channel,
	// otherwise it gets cropped).
	unchanged = -1

	// IMReadGrayScale always convert image to the single channel
	// grayscale image.
	gray_scale = 0

	// IMReadColor always converts image to the 3 channel BGR color image.
	color = 1

	// IMReadAnyDepth returns 16-bit/32-bit image when the input has the corresponding
	// depth, otherwise convert it to 8-bit.
	any_depth = 2

	// IMReadAnyColor the image is read in any possible color format.
	any_color = 4

	// IMReadLoadGDAL uses the gdal driver for loading the image.
	load_gdal = 8

	// IMReadReducedGrayscale2 always converts image to the single channel grayscale image
	// and the image size reduced 1/2.
	reduced_grayscale2 = 16

	// IMReadReducedColor2 always converts image to the 3 channel BGR color image and the
	// image size reduced 1/2.
	reduced_color2 = 17

	// IMReadReducedGrayscale4 always converts image to the single channel grayscale image and
	// the image size reduced 1/4.
	reduced_grayscale4 = 32

	// IMReadReducedColor4 always converts image to the 3 channel BGR color image and
	// the image size reduced 1/4.
	reduced_color4 = 33

	// IMReadReducedGrayscale8 always convert image to the single channel grayscale image and
	// the image size reduced 1/8.
	reduced_grayscale8 = 64

	// IMReadReducedColor8 always convert image to the 3 channel BGR color image and the
	// image size reduced 1/8.
	reduced_color8 = 65

	// IMReadIgnoreOrientation do not rotate the image according to EXIF's orientation flag.
	ignore_orientation = 128
}

// TODO: Define IMWriteFlag type?
pub enum IMWriteModeJpeg {
	//IMWriteJpegQuality is the quality from 0 to 100 for JPEG (the higher is the better). Default value is 95.
	quality = 1

	// IMWriteJpegProgressive enables JPEG progressive feature, 0 or 1, default is False.
	progressive = 2

	// IMWriteJpegOptimize enables JPEG optimization, 0 or 1, default is False.
	optimize = 3

	// IMWriteJpegRstInterval is the JPEG restart interval, 0 - 65535, default is 0 - no restart.
	rst_interval = 4

	// IMWriteJpegLumaQuality separates luma quality level, 0 - 100, default is 0 - don't use.
	luma_quality = 5

	// IMWriteJpegChromaQuality separates chroma quality level, 0 - 100, default is 0 - don't use.
	chroma_quality = 6
}
pub enum IMWriteMode {
	// IMWritePngCompression is the compression level from 0 to 9 for PNG. A
	// higher value means a smaller size and longer compression time.
	// If specified, strategy is changed to IMWRITE_PNG_STRATEGY_DEFAULT (Z_DEFAULT_STRATEGY).
	// Default value is 1 (best speed setting).
	png_compression = 16

	// IMWritePngStrategy is one of cv::IMWritePNGFlags, default is IMWRITE_PNG_STRATEGY_RLE.
	png_strategy = 17

	// IMWritePngBilevel is the binary level PNG, 0 or 1, default is 0.
	png_bilevel = 18

	// IMWritePxmBinary for PPM, PGM, or PBM can be a binary format flag, 0 or 1. Default value is 1.
	pxm_binary = 32

	// IMWriteWebpQuality is the quality from 1 to 100 for WEBP (the higher is
	// the better). By default (without any parameter) and for quality above
	// 100 the lossless compression is used.
	webp_quality = 64

	// IMWritePamTupletype sets the TUPLETYPE field to the corresponding string
	// value that is defined for the format.
	pam_tupletype = 128

	// IMWritePngStrategyDefault is the value to use for normal data.
	png_strategy_default = 0

	// IMWritePngStrategyFiltered is the value to use for data produced by a
	// filter (or predictor). Filtered data consists mostly of small values
	// with a somewhat random distribution. In this case, the compression
	// algorithm is tuned to compress them better.
	png_strategy_filtered = 1

	// IMWritePngStrategyHuffmanOnly forces Huffman encoding only (no string match).
	png_strategy_huffman_only = 2

	// IMWritePngStrategyRle is the value to use to limit match distances to
	// one (run-length encoding).
	png_strategy_rle = 3

	// IMWritePngStrategyFixed is the value to prevent the use of dynamic
	// Huffman codes, allowing for a simpler decoder for special applications.
	png_strategy_fixed = 4
}

// IMRead reads an image from a file into a Mat.
// The flags param is one of the IMReadFlag flags.
// If the image cannot be read (because of missing file, improper permissions,
// unsupported or invalid format), the function returns an empty Mat.
//
// For further details, please see:
// http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga288b8b3da0892bd651fce07b3bbd3a56
//
pub fn imread(name string, flags IMReadFlag) Mat {
	return new_mat_from_c(C.Image_IMRead(unsafe { &char(name.str) }, int(flags)))
}

// IMWrite writes a Mat to an image file.
//
// For further details, please see:
// http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#gabbc7ef1aa2edfaa87772f1202d67e0ce
//
pub fn imwrite(name string, img Mat) bool {
	return C.Image_IMWrite(unsafe { &char(name.str) }, img.p)
}

// // IMWriteWithParams writes a Mat to an image file. With that func you can
// // pass compression parameters.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#gabbc7ef1aa2edfaa87772f1202d67e0ce
// //
// func IMWriteWithParams(name string, img Mat, params []int) bool {
// 	cName := C.CString(name)
// 	defer C.free(unsafe.Pointer(cName))

// 	cparams := []C.int{}

// 	for _, v := range params {
// 		cparams = append(cparams, C.int(v))
// 	}

// 	paramsVector := C.struct_IntVector{}
// 	paramsVector.val = (*C.int)(&cparams[0])
// 	paramsVector.length = (C.int)(len(cparams))

// 	return bool(C.Image_IMWrite_WithParams(cName, img.p, paramsVector))
// }

// // FileExt represents a file extension.
// type FileExt string

// const (
// 	// PNGFileExt is the file extension for PNG.
// 	PNGFileExt FileExt = ".png"
// 	// JPEGFileExt is the file extension for JPEG.
// 	JPEGFileExt FileExt = ".jpg"
// 	// GIFFileExt is the file extension for GIF.
// 	GIFFileExt FileExt = ".gif"
// )

// // IMEncode encodes an image Mat into a memory buffer.
// // This function compresses the image and stores it in the returned memory buffer,
// // using the image format passed in in the form of a file extension string.
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga461f9ac09887e47797a54567df3b8b63
// //
// func IMEncode(fileExt FileExt, img Mat) (buf *NativeByteBuffer, err error) {
// 	cfileExt := C.CString(string(fileExt))
// 	defer C.free(unsafe.Pointer(cfileExt))

// 	buffer := newNativeByteBuffer()
// 	C.Image_IMEncode(cfileExt, img.Ptr(), buffer.nativePointer())
// 	return buffer, nil
// }

// // IMEncodeWithParams encodes an image Mat into a memory buffer.
// // This function compresses the image and stores it in the returned memory buffer,
// // using the image format passed in in the form of a file extension string.
// //
// // Usage example:
// //  buffer, err := gocv.IMEncodeWithParams(gocv.JPEGFileExt, img, []int{gocv.IMWriteJpegQuality, quality})
// //
// // For further details, please see:
// // http://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga461f9ac09887e47797a54567df3b8b63
// //
// func IMEncodeWithParams(fileExt FileExt, img Mat, params []int) (buf *NativeByteBuffer, err error) {
// 	cfileExt := C.CString(string(fileExt))
// 	defer C.free(unsafe.Pointer(cfileExt))

// 	cparams := []C.int{}

// 	for _, v := range params {
// 		cparams = append(cparams, C.int(v))
// 	}

// 	paramsVector := C.struct_IntVector{}
// 	paramsVector.val = (*C.int)(&cparams[0])
// 	paramsVector.length = (C.int)(len(cparams))

// 	b := newNativeByteBuffer()
// 	C.Image_IMEncode_WithParams(cfileExt, img.Ptr(), paramsVector, b.nativePointer())
// 	return b, nil
// }

// // IMDecode reads an image from a buffer in memory.
// // The function IMDecode reads an image from the specified buffer in memory.
// // If the buffer is too short or contains invalid data, the function
// // returns an empty matrix.
// //
// // For further details, please see:
// // https://docs.opencv.org/master/d4/da8/group__imgcodecs.html#ga26a67788faa58ade337f8d28ba0eb19e
// //
// func IMDecode(buf []byte, flags IMReadFlag) (Mat, error) {
// 	data, err := toByteArray(buf)
// 	if err != nil {
// 		return Mat{}, err
// 	}
// 	return newMat(C.Image_IMDecode(*data, C.int(flags))), nil
// }
