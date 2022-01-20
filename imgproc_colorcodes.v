module cv

// ColorConversionCode is a color conversion code used on Mat.
//
// For further details, please see:
// http://docs.opencv.org/master/d7/d1b/group__imgproc__misc.html#ga4e0972be5de079fed4e3a10e24ef5ef0
//
pub enum ColorConversionCode {
	// ColorBGRToBGRA adds alpha channel to BGR image.
	bgr_to_bgra  = 0

	// ColorBGRAToBGR removes alpha channel from BGR image.
	bgra_to_bgr  = 1

	// ColorBGRToRGBA converts from BGR to RGB with alpha channel.
	bgr_to_rgba  = 2

	// ColorRGBAToBGR converts from RGB with alpha to BGR color space.
	rgba_to_bgr  = 3

	// ColorBGRToRGB converts from BGR to RGB without alpha channel.
	bgr_to_rgb  = 4

	// ColorBGRAToRGBA converts from BGR with alpha channel
	// to RGB with alpha channel.
	bgra_to_rgba  = 5

	// ColorBGRToGray converts from BGR to grayscale.
	bgr_to_gray  = 6

	// ColorRGBToGray converts from RGB to grayscale.
	rgb_to_gray  = 7

	// ColorGrayToBGR converts from grayscale to BGR.
	gray_to_bgr  = 8

	// ColorGrayToBGRA converts from grayscale to BGR with alpha channel.
	gray_to_bgra  = 9

	// ColorBGRAToGray converts from BGR with alpha channel to grayscale.
	bgra_to_gray  = 10

	// ColorRGBAToGray converts from RGB with alpha channel to grayscale.
	rgba_to_gray  = 11

	// ColorBGRToBGR565 converts from BGR to BGR565 (16-bit images).
	bgr_to_bgr565  = 12

	// ColorRGBToBGR565 converts from RGB to BGR565 (16-bit images).
	rgb_to_bgr565  = 13

	// ColorBGR565ToBGR converts from BGR565 (16-bit images) to BGR.
	bgr565_to_bgr  = 14

	// ColorBGR565ToRGB converts from BGR565 (16-bit images) to RGB.
	bgr565_to_rgb  = 15

	// ColorBGRAToBGR565 converts from BGRA (with alpha channel)
	// to BGR565 (16-bit images).
	bgra_to_bgr565  = 16

	// ColorRGBAToBGR565 converts from RGBA (with alpha channel)
	// to BGR565 (16-bit images).
	rgba_to_bgr565  = 17

	// ColorBGR565ToBGRA converts from BGR565 (16-bit images)
	// to BGRA (with alpha channel).
	bgr565_to_bgra  = 18

	// ColorBGR565ToRGBA converts from BGR565 (16-bit images)
	// to RGBA (with alpha channel).
	bgr565_to_rgba  = 19

	// ColorGrayToBGR565 converts from grayscale
	// to BGR565 (16-bit images).
	gray_to_bgr565  = 20

	// ColorBGR565ToGray converts from BGR565 (16-bit images)
	// to grayscale.
	bgr565_to_gray  = 21

	// ColorBGRToBGR555 converts from BGR to BGR555 (16-bit images).
	bgr_to_bgr555  = 22

	// ColorRGBToBGR555 converts from RGB to BGR555 (16-bit images).
	rgb_to_bgr555  = 23

	// ColorBGR555ToBGR converts from BGR555 (16-bit images) to BGR.
	bgr555_to_bgr  = 24

	// ColorBGR555ToRGB converts from BGR555 (16-bit images) to RGB.
	bgr555_to_rgb  = 25

	// ColorBGRAToBGR555 converts from BGRA (with alpha channel)
	// to BGR555 (16-bit images).
	bgra_to_bgr555  = 26

	// ColorRGBAToBGR555 converts from RGBA (with alpha channel)
	// to BGR555 (16-bit images).
	rgba_to_bgr555  = 27

	// ColorBGR555ToBGRA converts from BGR555 (16-bit images)
	// to BGRA (with alpha channel).
	bgr555_to_bgra  = 28

	// ColorBGR555ToRGBA converts from BGR555 (16-bit images)
	// to RGBA (with alpha channel).
	bgr555_to_rgba  = 29

	// ColorGrayToBGR555 converts from grayscale to BGR555 (16-bit images).
	gray_to_bgr555  = 30

	// ColorBGR555ToGRAY converts from BGR555 (16-bit images) to grayscale.
	bgr555_to_gray  = 31

	// ColorBGRToXYZ converts from BGR to CIE XYZ.
	bgr_to_xyz  = 32

	// ColorRGBToXYZ converts from RGB to CIE XYZ.
	rgb_to_xyz  = 33

	// ColorXYZToBGR converts from CIE XYZ to BGR.
	xyz_to_bgr  = 34

	// ColorXYZToRGB converts from CIE XYZ to RGB.
	xyz_to_rgb  = 35

	// ColorBGRToYCrCb converts from BGR to luma-chroma (aka YCC).
	bgr_to_ycr_cb  = 36

	// ColorRGBToYCrCb converts from RGB to luma-chroma (aka YCC).
	rgb_to_ycr_cb  = 37

	// ColorYCrCbToBGR converts from luma-chroma (aka YCC) to BGR.
	ycr_cb_to_bgr  = 38

	// ColorYCrCbToRGB converts from luma-chroma (aka YCC) to RGB.
	ycr_cb_to_rgb  = 39

	// ColorBGRToHSV converts from BGR to HSV (hue saturation value).
	bgr_to_hsv  = 40

	// ColorRGBToHSV converts from RGB to HSV (hue saturation value).
	rgb_to_hsv  = 41

	// ColorBGRToLab converts from BGR to CIE Lab.
	bgr_to_lab  = 44

	// ColorRGBToLab converts from RGB to CIE Lab.
	rgb_to_lab  = 45

	// ColorBGRToLuv converts from BGR to CIE Luv.
	bgr_to_luv  = 50

	// ColorRGBToLuv converts from RGB to CIE Luv.
	rgb_to_luv  = 51

	// ColorBGRToHLS converts from BGR to HLS (hue lightness saturation).
	bgr_to_hls  = 52

	// ColorRGBToHLS converts from RGB to HLS (hue lightness saturation).
	rgb_to_hls  = 53

	// ColorHSVToBGR converts from HSV (hue saturation value) to BGR.
	hsv_to_bgr  = 54

	// ColorHSVToRGB converts from HSV (hue saturation value) to RGB.
	hsv_to_rgb  = 55

	// ColorLabToBGR converts from CIE Lab to BGR.
	lab_to_bgr  = 56

	// ColorLabToRGB converts from CIE Lab to RGB.
	lab_to_rgb  = 57

	// ColorLuvToBGR converts from CIE Luv to BGR.
	luv_to_bgr  = 58

	// ColorLuvToRGB converts from CIE Luv to RGB.
	luv_to_rgb  = 59

	// ColorHLSToBGR converts from HLS (hue lightness saturation) to BGR.
	hls_to_bgr  = 60

	// ColorHLSToRGB converts from HLS (hue lightness saturation) to RGB.
	hls_to_rgb  = 61

	// ColorBGRToHSVFull converts from BGR to HSV (hue saturation value) full.
	bgr_to_hsvfull  = 66

	// ColorRGBToHSVFull converts from RGB to HSV (hue saturation value) full.
	rgb_to_hsvfull  = 67

	// ColorBGRToHLSFull converts from BGR to HLS (hue lightness saturation) full.
	bgr_to_hlsfull  = 68

	// ColorRGBToHLSFull converts from RGB to HLS (hue lightness saturation) full.
	rgb_to_hlsfull  = 69

	// ColorHSVToBGRFull converts from HSV (hue saturation value) to BGR full.
	hsv_to_bgrfull  = 70

	// ColorHSVToRGBFull converts from HSV (hue saturation value) to RGB full.
	hsv_to_rgbfull  = 71

	// ColorHLSToBGRFull converts from HLS (hue lightness saturation) to BGR full.
	hls_to_bgrfull  = 72

	// ColorHLSToRGBFull converts from HLS (hue lightness saturation) to RGB full.
	hls_to_rgbfull  = 73

	// ColorLBGRToLab converts from LBGR to CIE Lab.
	lbgr_to_lab  = 74

	// ColorLRGBToLab converts from LRGB to CIE Lab.
	lrgb_to_lab  = 75

	// ColorLBGRToLuv converts from LBGR to CIE Luv.
	lbgr_to_luv  = 76

	// ColorLRGBToLuv converts from LRGB to CIE Luv.
	lrgb_to_luv  = 77

	// ColorLabToLBGR converts from CIE Lab to LBGR.
	lab_to_lbgr  = 78

	// ColorLabToLRGB converts from CIE Lab to LRGB.
	lab_to_lrgb  = 79

	// ColorLuvToLBGR converts from CIE Luv to LBGR.
	luv_to_lbgr  = 80

	// ColorLuvToLRGB converts from CIE Luv to LRGB.
	luv_to_lrgb  = 81

	// ColorBGRToYUV converts from BGR to YUV.
	bgr_to_yuv  = 82

	// ColorRGBToYUV converts from RGB to YUV.
	rgb_to_yuv  = 83

	// ColorYUVToBGR converts from YUV to BGR.
	yuv_to_bgr  = 84

	// ColorYUVToRGB converts from YUV to RGB.
	yuv_to_rgb  = 85

	// ColorYUVToRGBNV12 converts from YUV 4:2:0 to RGB NV12.
	yuv_to_rgbnv12  = 90

	// ColorYUVToBGRNV12 converts from YUV 4:2:0 to BGR NV12.
	yuv_to_bgrnv12  = 91

	// ColorYUVToRGBNV21 converts from YUV 4:2:0 to RGB NV21.
	yuv_to_rgbnv21  = 92

	// ColorYUVToBGRNV21 converts from YUV 4:2:0 to BGR NV21.
	yuv_to_bgrnv21  = 93

	// ColorYUVToRGBANV12 converts from YUV 4:2:0 to RGBA NV12.
	yuv_to_rgbanv12  = 94

	// ColorYUVToBGRANV12 converts from YUV 4:2:0 to BGRA NV12.
	yuv_to_bgranv12  = 95

	// ColorYUVToRGBANV21 converts from YUV 4:2:0 to RGBA NV21.
	yuv_to_rgbanv21  = 96

	// ColorYUVToBGRANV21 converts from YUV 4:2:0 to BGRA NV21.
	yuv_to_bgranv21  = 97

	yuv_to_rgbyv12  = 98
	yuv_to_bgryv12  = 99
	yuv_to_rgbiyuv  = 100
	yuv_to_bgriyuv  = 101

	yuv_to_rgbayv12  = 102
	yuv_to_bgrayv12  = 103
	yuv_to_rgbaiyuv  = 104
	yuv_to_bgraiyuv  = 105

	yuv_to_gray420  = 106

	// YUV 4:2:2 family to RGB
	yuv_to_rgbuyvy  = 107
	yuv_to_bgruyvy  = 108

	yuv_to_rgbauyvy  = 111
	yuv_to_bgrauyvy  = 112

	yuv_to_rgbyuy2  = 115
	yuv_to_bgryuy2  = 116
	yuv_to_rgbyvyu  = 117
	yuv_to_bgryvyu  = 118

	yuv_to_rgbayuy2  = 119
	yuv_to_bgrayuy2  = 120
	yuv_to_rgbayvyu  = 121
	yuv_to_bgrayvyu  = 122

	yuv_to_grayuyvy  = 123
	yuv_to_grayyuy2  = 124

	// alpha premultiplication
	rgbatom_rgba  = 125
	colorm_rgba_to_rgba  = 126

	// RGB to YUV 4:2:0 family
	rgb_to_yuvi420  = 127
	bgr_to_yuvi420  = 128

	rgba_to_yuvi420  = 129
	bgra_to_yuvi420  = 130
	rgb_to_yuvyv12  = 131
	bgr_to_yuvyv12  = 132
	rgba_to_yuvyv12  = 133
	bgra_to_yuvyv12  = 134

	// Demosaicing
	bayer_bg_to_bgr  = 46
	bayer_gb_to_bgr  = 47
	bayer_rg_to_bgr  = 48
	bayer_gr_to_bgr  = 49

	bayer_bg_to_gray  = 86
	bayer_gb_to_gray  = 87
	bayer_rg_to_gray  = 88
	bayer_gr_to_gray  = 89

	// Demosaicing using Variable Number of Gradients
	bayer_bg_to_bgrvng  = 62
	bayer_gb_to_bgrvng  = 63
	bayer_rg_to_bgrvng  = 64
	bayer_gr_to_bgrvng  = 65

	// Edge-Aware Demosaicing
	bayer_bg_to_bgrea  = 135
	bayer_gb_to_bgrea  = 136
	bayer_rg_to_bgrea  = 137
	bayer_gr_to_bgrea  = 138

	// Demosaicing with alpha channel
	bayer_bg_to_bgra  = 139
	bayer_gb_to_bgra  = 140
	bayer_rg_to_bgra  = 141
	bayer_gr_to_bgra  = 142

	colorcvtmax  = 143
}
