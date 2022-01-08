module cv

#include "imgcodecs.h"

fn C.Image_IMRead(&char, int) &C.Mat

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
