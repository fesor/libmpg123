/*
 * libmpg123: MPEG Audio Decoder library (version 1.19.0)
 *
 * copyright 1995-2010 by the mpg123 project - free software under the terms of the LGPL 2.1
 * see COPYING and AUTHORS files in distribution or http://mpg123.org
*/

module mpg123.api;

import core.stdc.config;

alias int off_t;


struct mpg123_handle;

extern (System) 
{
	int  mpg123_init();
	
	void mpg123_exit();
	
	mpg123_handle *mpg123_new(const char* decoder, int *error);
	
	void mpg123_delete(mpg123_handle *mh);
	
}

enum mpg123_parms
{
	MPG123_VERBOSE = 0,        
	MPG123_FLAGS,          
	MPG123_ADD_FLAGS,      
	MPG123_FORCE_RATE,     
	MPG123_DOWN_SAMPLE,    
	MPG123_RVA,            
	MPG123_DOWNSPEED,      
	MPG123_UPSPEED,        
	MPG123_START_FRAME,    
	MPG123_DECODE_FRAMES,  
	MPG123_ICY_INTERVAL,   
	MPG123_OUTSCALE,       
	MPG123_TIMEOUT,        
	MPG123_REMOVE_FLAGS,   
	MPG123_RESYNC_LIMIT,   
	MPG123_INDEX_SIZE,      
	MPG123_PREFRAMES, 
	MPG123_FEEDPOOL,  
	MPG123_FEEDBUFFER,
};

enum mpg123_param_flags
{
	MPG123_FORCE_MONO   = 0x7,  
	MPG123_MONO_LEFT    = 0x1,  
	MPG123_MONO_RIGHT   = 0x2,  
	MPG123_MONO_MIX     = 0x4,  
	MPG123_FORCE_STEREO = 0x8,  
	MPG123_FORCE_8BIT   = 0x10, 
	MPG123_QUIET        = 0x20, 
	MPG123_GAPLESS      = 0x40, 
	MPG123_NO_RESYNC    = 0x80, 
	MPG123_SEEKBUFFER   = 0x100,
	MPG123_FUZZY        = 0x200,
	MPG123_FORCE_FLOAT  = 0x400,
	MPG123_PLAIN_ID3TEXT = 0x800,
	MPG123_IGNORE_STREAMLENGTH = 0x1000,
	MPG123_SKIP_ID3V2 = 0x2000,
	MPG123_IGNORE_INFOFRAME = 0x4000,
	MPG123_AUTO_RESAMPLE = 0x8000,
	MPG123_PICTURE = 0x10000,
};

enum mpg123_param_rva
{
	MPG123_RVA_OFF   = 0, 
	MPG123_RVA_MIX   = 1, 
	MPG123_RVA_ALBUM = 2, 
	MPG123_RVA_MAX   = MPG123_RVA_ALBUM,
};



/* TODO: Assess the possibilities and troubles of changing parameters during playback. */

extern (System)
{
	int mpg123_param(mpg123_handle *mh, mpg123_parms type, long value, double fvalue);
	
	int mpg123_getparam(mpg123_handle *mh, mpg123_parms type, long *val, double *fval);
}

enum mpg123_feature_set
{
	MPG123_FEATURE_ABI_UTF8OPEN = 0,    
	MPG123_FEATURE_OUTPUT_8BIT,          
	MPG123_FEATURE_OUTPUT_16BIT,
	MPG123_FEATURE_OUTPUT_32BIT,         
	MPG123_FEATURE_INDEX,                
	MPG123_FEATURE_PARSE_ID3V2,
	MPG123_FEATURE_DECODE_LAYER1,        
	MPG123_FEATURE_DECODE_LAYER2,        
	MPG123_FEATURE_DECODE_LAYER3,        
	MPG123_FEATURE_DECODE_ACCURATE,      
	MPG123_FEATURE_DECODE_DOWNSAMPLE,    
	MPG123_FEATURE_DECODE_NTOM,          
	MPG123_FEATURE_PARSE_ICY,            
	MPG123_FEATURE_TIMEOUT_READ,         
};

extern (System) {
	int mpg123_feature(const mpg123_feature_set key);
}

enum mpg123_errors
{
	MPG123_DONE=-12,        
	MPG123_NEW_FORMAT=-11,  
	MPG123_NEED_MORE=-10,   
	MPG123_ERR=-1,                  
	MPG123_OK=0,                    
	MPG123_BAD_OUTFORMAT,   
	MPG123_BAD_CHANNEL,             
	MPG123_BAD_RATE,                
	MPG123_ERR_16TO8TABLE,  
	MPG123_BAD_PARAM,               
	MPG123_BAD_BUFFER,              
	MPG123_OUT_OF_MEM,              
	MPG123_NOT_INITIALIZED, 
	MPG123_BAD_DECODER,             
	MPG123_BAD_HANDLE,              
	MPG123_NO_BUFFERS,              
	MPG123_BAD_RVA,                 
	MPG123_NO_GAPLESS,              
	MPG123_NO_SPACE,                
	MPG123_BAD_TYPES,               
	MPG123_BAD_BAND,                
	MPG123_ERR_NULL,                
	MPG123_ERR_READER,              
	MPG123_NO_SEEK_FROM_END,
	MPG123_BAD_WHENCE,              
	MPG123_NO_TIMEOUT,              
	MPG123_BAD_FILE,                
	MPG123_NO_SEEK,                 
	MPG123_NO_READER,               
	MPG123_BAD_PARS,                
	MPG123_BAD_INDEX_PAR,   
	MPG123_OUT_OF_SYNC,     
	MPG123_RESYNC_FAIL,     
	MPG123_NO_8BIT, 
	MPG123_BAD_ALIGN,       
	MPG123_NULL_BUFFER,     
	MPG123_NO_RELSEEK,      
	MPG123_NULL_POINTER, 
	MPG123_BAD_KEY, 
	MPG123_NO_INDEX,        
	MPG123_INDEX_FAIL,      
	MPG123_BAD_DECODER_SETUP,       
	MPG123_MISSING_FEATURE,  
	MPG123_BAD_VALUE,
	MPG123_LSEEK_FAILED,
	MPG123_BAD_CUSTOM_IO, 
	MPG123_LFS_OVERFLOW, 
	MPG123_INT_OVERFLOW, 
};

extern (System) 
{
	const char* mpg123_plain_strerror(int errcode);
	
	const char* mpg123_strerror(mpg123_handle *mh);
	
	int mpg123_errcode(mpg123_handle *mh);
	
	const char **mpg123_decoders();
	
	const char **mpg123_supported_decoders();
	
	int mpg123_decoder(mpg123_handle *mh, const char* decoder_name);
	
	const char* mpg123_current_decoder(mpg123_handle *mh);
}

enum mpg123_enc_enum
{
	MPG123_ENC_8      = 0x00f  
	,MPG123_ENC_16     = 0x040  
	,MPG123_ENC_24     = 0x4000 
	,MPG123_ENC_32     = 0x100  
	,MPG123_ENC_SIGNED = 0x080  
	,MPG123_ENC_FLOAT  = 0xe00  
	,MPG123_ENC_SIGNED_16   = (MPG123_ENC_16|MPG123_ENC_SIGNED|0x10) 
	,MPG123_ENC_UNSIGNED_16 = (MPG123_ENC_16|0x20)                   
	,MPG123_ENC_UNSIGNED_8  = 0x01                                   
	,MPG123_ENC_SIGNED_8    = (MPG123_ENC_SIGNED|0x02)               
	,MPG123_ENC_ULAW_8      = 0x04                                   
	,MPG123_ENC_ALAW_8      = 0x08                                   
	,MPG123_ENC_SIGNED_32   = MPG123_ENC_32|MPG123_ENC_SIGNED|0x1000 
	,MPG123_ENC_UNSIGNED_32 = MPG123_ENC_32|0x2000                   
	,MPG123_ENC_SIGNED_24   = MPG123_ENC_24|MPG123_ENC_SIGNED|0x1000 
	,MPG123_ENC_UNSIGNED_24 = MPG123_ENC_24|0x2000                   
	,MPG123_ENC_FLOAT_32    = 0x200                                  
	,MPG123_ENC_FLOAT_64    = 0x400                                  
	,MPG123_ENC_ANY = ( MPG123_ENC_SIGNED_16  | MPG123_ENC_UNSIGNED_16 | MPG123_ENC_UNSIGNED_8
	                   | MPG123_ENC_SIGNED_8   | MPG123_ENC_ULAW_8      | MPG123_ENC_ALAW_8
	                   | MPG123_ENC_SIGNED_32  | MPG123_ENC_UNSIGNED_32
	                   | MPG123_ENC_SIGNED_24  | MPG123_ENC_UNSIGNED_24
	                   | MPG123_ENC_FLOAT_32   | MPG123_ENC_FLOAT_64 ) 
};

enum mpg123_channelcount
{
	MPG123_MONO   = 1,
	MPG123_STEREO = 2,
};

extern (System) {
	
	void mpg123_rates(const long **list, size_t *number);
	
	void mpg123_encodings(const int **list, size_t *number);
	
	int mpg123_encsize(int encoding);
	
	int mpg123_format_none(mpg123_handle *mh);
	
	int mpg123_format_all(mpg123_handle *mh);
	
	int mpg123_format(mpg123_handle *mh, long rate, int channels, int encodings);
	
	int mpg123_format_support(mpg123_handle *mh, long rate, int encoding);
	
	int mpg123_getformat(mpg123_handle *mh, long *rate, int *channels, int *encoding);
	
	/* reading samples / triggering decoding, possible return values: */
	int mpg123_open(mpg123_handle *mh, const char *path);
	
	int mpg123_open_fd(mpg123_handle *mh, int fd);
	
	int mpg123_open_handle(mpg123_handle *mh, void *iohandle);
	
	int mpg123_open_feed(mpg123_handle *mh);
	
	int mpg123_close(mpg123_handle *mh);
	
	int mpg123_read(mpg123_handle *mh, ubyte *outmemory, size_t outmemsize, size_t *done);
	
	int mpg123_feed(mpg123_handle *mh, const ubyte *inp, size_t size);
	
	int mpg123_decode(mpg123_handle *mh, const ubyte *inmemory, size_t inmemsize, ubyte *outmemory, size_t outmemsize, size_t *done);
	
	int mpg123_decode_frame(mpg123_handle *mh, off_t *num, ubyte **audio, size_t *bytes);
	
	int mpg123_framebyframe_decode(mpg123_handle *mh, off_t *num, ubyte **audio, size_t *bytes);
	
	int mpg123_framebyframe_next(mpg123_handle *mh);
	
	int mpg123_framedata(mpg123_handle *mh, c_ulong *header, ubyte **bodydata, size_t *bodybytes);
	
	off_t mpg123_framepos(mpg123_handle *mh);
	
	off_t mpg123_tell(mpg123_handle *mh);
	
	off_t mpg123_tellframe(mpg123_handle *mh);
	
	off_t mpg123_tell_stream(mpg123_handle *mh);
	
	off_t mpg123_seek(mpg123_handle *mh, off_t sampleoff, int whence);
	
	off_t mpg123_feedseek(mpg123_handle *mh, off_t sampleoff, int whence, off_t *input_offset);
	
	off_t mpg123_seek_frame(mpg123_handle *mh, off_t frameoff, int whence);
	
	off_t mpg123_timeframe(mpg123_handle *mh, double sec);
	
	int mpg123_index(mpg123_handle *mh, off_t **offsets, off_t *step, size_t *fill);
	
	int mpg123_set_index(mpg123_handle *mh, off_t *offsets, off_t step, size_t fill);
	
	int mpg123_position( mpg123_handle *mh, off_t frame_offset, off_t buffered_bytes, off_t *current_frame, off_t *frames_left, double *current_seconds, double *seconds_left);
	
}

enum mpg123_channels
{
	MPG123_LEFT=0x1,        
	MPG123_RIGHT=0x2,
	MPG123_LR=0x3,  
};


extern (System) 
{
	
	int mpg123_eq(mpg123_handle *mh, mpg123_channels channel, int band, double val);
	
	double mpg123_geteq(mpg123_handle *mh, mpg123_channels channel, int band);
	
	int mpg123_reset_eq(mpg123_handle *mh);
	
	int mpg123_volume(mpg123_handle *mh, double vol);
	
	int mpg123_volume_change(mpg123_handle *mh, double change);
	
	int mpg123_getvolume(mpg123_handle *mh, double *base, double *really, double *rva_db);
	
}

enum mpg123_vbr {
	MPG123_CBR=0,   
	MPG123_VBR,             
	MPG123_ABR,              
};

enum mpg123_version {
	MPG123_1_0=0,   
	MPG123_2_0,             
	MPG123_2_5,              
};


enum mpg123_mode {
	MPG123_M_STEREO=0,      
	MPG123_M_JOINT,         
	MPG123_M_DUAL,          
	MPG123_M_MONO,           
};


enum mpg123_flags {
	MPG123_CRC=0x1,                 
	MPG123_COPYRIGHT=0x2,   
	MPG123_PRIVATE=0x4,             
	MPG123_ORIGINAL=0x8,     
};

struct mpg123_frameinfo
{
	mpg123_version lib_version; // change property name to fix conflict with D keywords
	int layer;                                              
	long rate;                                              
	mpg123_mode mode;                  
	int mode_ext;                                   
	int framesize;                                  
	mpg123_flags flags;                
	int emphasis;                                   
	int bitrate;                                    
	int abr_rate;                                   
	mpg123_vbr vbr;                    
};

extern (System)
{
	int mpg123_info(mpg123_handle *mh, mpg123_frameinfo *mi);
	
	size_t mpg123_safe_buffer(); 
	
	int mpg123_scan(mpg123_handle *mh);
	
	off_t mpg123_length(mpg123_handle *mh);
	
	int mpg123_set_filesize(mpg123_handle *mh, off_t size);
	
	double mpg123_tpf(mpg123_handle *mh);
	
	int mpg123_spf(mpg123_handle *mh);
	
	long mpg123_clip(mpg123_handle *mh);
}

enum mpg123_state
{
	MPG123_ACCURATE = 1,
	MPG123_BUFFERFILL,   
	MPG123_FRANKENSTEIN, 
	MPG123_FRESH_DECODER,
};

extern (System) int mpg123_getstate(mpg123_handle *mh, mpg123_state key, long *val, double *fval);

struct mpg123_string
{
	char* p;     
	size_t size; 
	size_t fill; 
};

extern (System) 
{
	void mpg123_init_string(mpg123_string* sb);
	
	void mpg123_free_string(mpg123_string* sb);
	
	int  mpg123_resize_string(mpg123_string* sb, size_t news);
	
	int  mpg123_grow_string(mpg123_string* sb, size_t news);
	
	int  mpg123_copy_string(mpg123_string* from, mpg123_string* to);
	
	int  mpg123_add_string(mpg123_string* sb, const char* stuff);
	
	int  mpg123_add_substring(mpg123_string *sb, const char *stuff, size_t from, size_t count);
	
	int  mpg123_set_string(mpg123_string* sb, const char* stuff);
	
	int  mpg123_set_substring(mpg123_string *sb, const char *stuff, size_t from, size_t count);
	
	size_t mpg123_strlen(mpg123_string *sb, int utf8);
	
	int mpg123_chomp_string(mpg123_string *sb);
}

enum mpg123_text_encoding
{
	mpg123_text_unknown  = 0,
	mpg123_text_utf8     = 1, 
	mpg123_text_latin1   = 2, 
	mpg123_text_icy      = 3, 
	mpg123_text_cp1252   = 4, 
	mpg123_text_utf16    = 5, 
	mpg123_text_utf16bom = 6, 
	mpg123_text_utf16be  = 7, 
	mpg123_text_max      = 7, 
};

enum mpg123_id3_enc
{
	mpg123_id3_latin1   = 0, 
	mpg123_id3_utf16bom = 1, 
	mpg123_id3_utf16be  = 2, 
	mpg123_id3_utf8     = 3, 
	mpg123_id3_enc_max  = 3,
};

extern (System) 
{
	enum mpg123_text_encoding mpg123_enc_from_id3(ubyte id3_enc_byte);
	
	int mpg123_store_utf8(mpg123_string *sb, mpg123_text_encoding enc, const ubyte *source, size_t source_size);
}

struct mpg123_text
{
	char lang[3]; 
	char id[4];   
	mpg123_string description; 
	mpg123_string text;        
};

enum mpg123_id3_pic_type
{
	mpg123_id3_pic_other          =  0,
	mpg123_id3_pic_icon           =  1,
	mpg123_id3_pic_other_icon     =  2,
	mpg123_id3_pic_front_cover    =  3,
	mpg123_id3_pic_back_cover     =  4,
	mpg123_id3_pic_leaflet        =  5,
	mpg123_id3_pic_media          =  6,
	mpg123_id3_pic_lead           =  7,
	mpg123_id3_pic_artist         =  8,
	mpg123_id3_pic_conductor      =  9,
	mpg123_id3_pic_orchestra      = 10,
	mpg123_id3_pic_composer       = 11,
	mpg123_id3_pic_lyricist       = 12,
	mpg123_id3_pic_location       = 13,
	mpg123_id3_pic_recording      = 14,
	mpg123_id3_pic_performance    = 15,
	mpg123_id3_pic_video          = 16,
	mpg123_id3_pic_fish           = 17,
	mpg123_id3_pic_illustration   = 18,
	mpg123_id3_pic_artist_logo    = 19,
	mpg123_id3_pic_publisher_logo = 20,
};

struct mpg123_picture
{
	char type;
	mpg123_string description;
	mpg123_string mime_type;
	size_t size;
	ubyte* data;
};

struct mpg123_id3v2
{
	ubyte _version; // add underscore to fix conflict with D keywords
	mpg123_string *title;   
	mpg123_string *artist;  
	mpg123_string *album;   
	mpg123_string *year;    
	mpg123_string *genre;   
	mpg123_string *comment; 
	
	/* 
	 * Encountered ID3v2 fields are appended to these lists.
     * There can be multiple occurences, the pointers above always point to the last encountered data. 
	 */
	mpg123_text    *comment_list; 
	size_t          comments;     
	mpg123_text    *text;         
	size_t          texts;        
	mpg123_text    *extra;        
	size_t          extras;       
	mpg123_picture  *picture;     
	size_t           pictures;    
};

struct mpg123_id3v1
{
	char tag[3];         
	char title[30];      
	char artist[30];     
	char album[30];      
	char year[4];        
	char comment[30];    
	ubyte genre; 
};

enum MPG123_ID3  = 0x3;
enum MPG123_NEW_ID3 = 0x1;
enum MPG123_ICY = 0xc; 
enum MPG123_NEW_ICY = 0x4;

extern (System) 
{
	int mpg123_meta_check(mpg123_handle *mh); /* On error (no valid handle) just 0 is returned. */
	
	void mpg123_meta_free(mpg123_handle *mh);
	
	int mpg123_id3(mpg123_handle *mh, mpg123_id3v1 **v1, mpg123_id3v2 **v2);
	
	int mpg123_icy(mpg123_handle *mh, char **icy_meta); /* same for ICY meta string */
	
	char* mpg123_icy2utf8(const char* icy_text);
}

struct mpg123_pars;



extern (System) 
{
	mpg123_handle *mpg123_parnew(mpg123_pars *mp, const char* decoder, int *error);
	
	mpg123_pars *mpg123_new_pars(int *error);
	
	void mpg123_delete_pars(mpg123_pars* mp);
	
	int mpg123_fmt_none(mpg123_pars *mp);
	
	int mpg123_fmt_all(mpg123_pars *mp);
	
	int mpg123_fmt(mpg123_pars *mh, long rate, int channels, int encodings); /* 0 is good, -1 is error */
	
	int mpg123_fmt_support(mpg123_pars *mh,   long rate, int encoding);
	
	int mpg123_par(mpg123_pars *mp, mpg123_parms type, long value, double fvalue);
	
	int mpg123_getpar(mpg123_pars *mp, mpg123_parms type, long *val, double *fval);
	
	int mpg123_replace_buffer(mpg123_handle *mh, ubyte *data, size_t size);
	
	size_t mpg123_outblock(mpg123_handle *mh);

	// callbacks
	alias size_t function (int, void *, size_t) r_read;

	alias off_t function (void *, off_t, int) r_lseek;

	alias void function(void*) cleanup;
	
	int mpg123_replace_reader(mpg123_handle *mh, r_read, r_lseek);
	
	int mpg123_replace_reader_handle(mpg123_handle *mh, r_read, r_lseek, cleanup);
}